from flask import Flask, render_template, jsonify
from flask_socketio import SocketIO
import os
import subprocess
import markdown
import pty
import select
import termios
import struct
import fcntl
import shlex
import eventlet

# Monkey patch for eventlet
eventlet.monkey_patch()

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app, async_mode='eventlet')

LABS_DIR = os.path.abspath("../labs")

# Terminal Managment
fd = None
child_pid = None

def set_winsize(fd, row, col, xpix=0, ypix=0):
    winsize = struct.pack("HHHH", row, col, xpix, ypix)
    fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)

def read_and_forward_pty_output(fd, socket):
    max_read_bytes = 1024 * 20
    while True:
        socketio.sleep(0.01)
        if fd:
            timeout_sec = 0
            (data_ready, _, _) = select.select([fd], [], [], timeout_sec)
            if data_ready:
                output = os.read(fd, max_read_bytes).decode(errors='ignore')
                socket.emit('output', {'output': output})

@socketio.on('connect', namespace='/pty')
def connect():
    global fd, child_pid
    if child_pid:
        # Already started
        return

    # Create pty
    (child_pid, fd) = pty.fork()
    if child_pid == 0:
        # Child process
        subprocess.run(["bash"])
    else:
        # Parent process
        set_winsize(fd, 24, 80)
        socketio.start_background_task(target=read_and_forward_pty_output, fd=fd, socket=socketio)

@socketio.on('input', namespace='/pty')
def input(data):
    if fd:
        os.write(fd, data['input'].encode())

@socketio.on('resize', namespace='/pty')
def resize(data):
    if fd:
        set_winsize(fd, data['rows'], data['cols'])

# --- Dashboard Routes ---

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
    socketio.run(app, debug=True, host='0.0.0.0', port=5000)
