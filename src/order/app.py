import os
import requests
from flask import Flask, jsonify, request

app = Flask(__name__)

PAYMENT_SERVICE_URL = os.getenv('PAYMENT_SERVICE_URL', 'http://localhost:8082')

orders = []

@app.route('/health', methods=['GET'])
def health():
    return "OK", 200

@app.route('/orders', methods=['POST'])
def create_order():
    data = request.json
    product_id = data.get('product_id')
    
    # 1. Simulate Payment
    try:
        payment_resp = requests.post(f"{PAYMENT_SERVICE_URL}/pay", json={'amount': 100})
        if payment_resp.status_code != 200:
            return jsonify({"error": "Payment failed"}), 400
    except Exception as e:
        return jsonify({"error": f"Payment service unavailable: {str(e)}"}), 503

    # 2. Save Order (Mocked)
    order = {"id": len(orders) + 1, "product_id": product_id, "status": "CONFIRMED"}
    orders.append(order)
    
    return jsonify(order), 201

@app.route('/orders', methods=['GET'])
def list_orders():
    return jsonify(orders), 200

if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
