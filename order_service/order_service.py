from flask import Flask, jsonify, request
app = Flask(__name__)

orders = []

@app.route('/orders', methods=['POST'])
def place_order():
    data = request.get_json()
    orders.append(data)
    return jsonify({"message": "Order placed.", "order": data}), 201

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Order Service API", "endpoints": ["/orders", "/healthz"]})

@app.route('/healthz', methods=['GET'])
def healthz():
    return jsonify({"status": "ok"})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002, debug=True)
