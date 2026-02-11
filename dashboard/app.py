import eventlet
eventlet.monkey_patch()

from flask import Flask, render_template, jsonify
from flask_socketio import SocketIO, emit
import os
import pty
import select
import termios
import struct
import fcntl
import signal
import markdown

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
# Disable reloader to prevent signal issues
socketio = SocketIO(app, async_mode='eventlet')

# Fix path
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LABS_DIR = os.path.join(BASE_DIR, "labs")

# Global session state
# Note: For a single-user local app, globals are fine.
# For multi-user, we'd need a dict keyed by session ID.
user_terminals = {}

def set_winsize(fd, row, col, xpix=0, ypix=0):
    try:
        winsize = struct.pack("HHHH", row, col, xpix, ypix)
        fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)
    except:
        pass

def read_and_forward_pty_output(fd, sid):
    """Background thread to read from PTY and send to specific client."""
    max_read_bytes = 1024
    while True:
        socketio.sleep(0.01)
        if fd not in user_terminals.get(sid, {}).values():
            break

        try:
            timeout_sec = 0
            (data_ready, _, _) = select.select([fd], [], [], timeout_sec)
            if data_ready:
                output = os.read(fd, max_read_bytes)
                if output:
                    socketio.emit('output', {'output': output.decode(errors='ignore')}, room=sid, namespace='/pty')
                else:
                    # EOF
                    break
        except OSError as e:
            # EIO happens on Linux when slave closes
            if e.errno == 5: 
                break
            else:
                raise
        except Exception:
            break
    
    # Cleanup if loop exits
    print(f"Terminal background task ended for {sid}")

@socketio.on('connect', namespace='/pty')
def connect():
    """Start a new terminal session for the client."""
    sid = request.sid if hasattr(request, 'sid') else 'default'
    print(f"Client connected: {sid}")
    
    # Clean up old session if exists
    if 'fd' in user_terminals.get(sid, {}):
        old_fd = user_terminals[sid]['fd']
        old_pid = user_terminals[sid]['pid']
        try:
            os.close(old_fd)
            os.kill(old_pid, signal.SIGKILL)
            os.waitpid(old_pid, os.WNOHANG)
        except:
            pass

    # Create new PTY
    (child_pid, fd) = pty.fork()
    
    if child_pid == 0:
        # Child: Start Bash
        os.environ['TERM'] = 'xterm-256color'
        # Replace python process with bash
        os.execlp("bash", "bash")
    else:
        # Parent: Manage FD
        user_terminals[sid] = {'fd': fd, 'pid': child_pid}
        set_winsize(fd, 24, 80)
        socketio.start_background_task(target=read_and_forward_pty_output, fd=fd, sid=sid)
        emit('output', {'output': '\r\n🚀 New Terminal Session Started\r\n'}, namespace='/pty')

@socketio.on('disconnect', namespace='/pty')
def disconnect():
    sid = request.sid
    print(f"Client disconnected: {sid}")
    # We could kill the process here, but keeping it alive for a reload might be nice?
    # User requested "new one", so we killed on connect above.
    # Let's clean up here too to be safe.
    if sid in user_terminals:
        fd = user_terminals[sid]['fd']
        pid = user_terminals[sid]['pid']
        try:
            os.close(fd)
            os.kill(pid, signal.SIGKILL)
            os.waitpid(pid, os.WNOHANG)
        except:
            pass
        del user_terminals[sid]

@socketio.on('input', namespace='/pty')
def input_data(data):
    sid = request.sid
    if sid in user_terminals:
        fd = user_terminals[sid]['fd']
        try:
            os.write(fd, data['input'].encode())
        except OSError:
            pass

@socketio.on('resize', namespace='/pty')
def resize(data):
    sid = request.sid
    if sid in user_terminals:
        fd = user_terminals[sid]['fd']
        set_winsize(fd, data['rows'], data['cols'])

# --- Dashboard Routes (Unchanged) ---
from flask import request # import request for sid

def get_labs():
    labs = []
    if not os.path.exists(LABS_DIR):
        return []
    for d in sorted(os.listdir(LABS_DIR)):
        path = os.path.join(LABS_DIR, d)
        if os.path.isdir(path):
            labs.append({
                "id": d,
                "name": d.replace("-", " ").title(),
                "path": path
            })
    return labs

@app.route('/')
def index():
    return render_template('index.html', labs=get_labs())

@app.route('/lab/<lab_id>')
def lab(lab_id):
    lab_path = os.path.join(LABS_DIR, lab_id)
    readme_path = os.path.join(lab_path, "instructions.md")
    content = "Instructions not found."
    if os.path.exists(readme_path):
        with open(readme_path, 'r') as f:
            content = markdown.markdown(f.read(), extensions=['fenced_code', 'codehilite'])
    return render_template('lab.html', lab_id=lab_id, content=content, labs=get_labs())

@app.route('/api/verify/<lab_id>')
def verify(lab_id):
    check_script = os.path.join(LABS_DIR, lab_id, "check.sh")
    if not os.path.exists(check_script):
        return jsonify({"success": False, "output": "No check script found."})
    try:
        result = subprocess.run([check_script], capture_output=True, text=True, timeout=10)
        return jsonify({
            "success": result.returncode == 0,
            "output": result.stdout + result.stderr
        })
    except Exception as e:
        return jsonify({"success": False, "output": str(e)})

if __name__ == '__main__':
    print("Starting KubeShop Dashboard on http://localhost:5000")
    # debug=True causes reloader which breaks eventlet sometimes. 
    # disable reloader to be safe.
    socketio.run(app, debug=False, use_reloader=False, host='0.0.0.0', port=5000)
