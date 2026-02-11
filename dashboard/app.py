from flask import Flask, render_template, jsonify
import os
import subprocess
import markdown

app = Flask(__name__)

LABS_DIR = os.path.abspath("../labs")

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
        # Run check script
        result = subprocess.run([check_script], capture_output=True, text=True, timeout=10)
        return jsonify({
            "success": result.returncode == 0,
            "output": result.stdout + result.stderr
        })
    except Exception as e:
        return jsonify({"success": False, "output": str(e)})

if __name__ == '__main__':
    print("Starting KubeShop Dashboard on http://localhost:5000")
    app.run(debug=True, host='0.0.0.0', port=5000)
