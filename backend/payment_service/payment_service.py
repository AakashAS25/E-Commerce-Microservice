from flask import Flask, jsonify, request
app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Payment Service API", "endpoints": ["/pay (POST)"]})

@app.route('/pay', methods=['POST'])
def pay():
    data = request.get_json(silent=True) or {}
    order_id = data.get("order_id") or request.form.get("order_id") or request.args.get("order_id")
    if order_id is None:
        return jsonify({"error": "Missing order_id"}), 400
    try:
        order_id = int(order_id)
    except (TypeError, ValueError):
        return jsonify({"error": "order_id must be an integer"}), 400
    return jsonify({"status": "success", "txn_id": 123456, "order_id": order_id})

@app.route('/pay', methods=['GET'])
def pay_info():
    return jsonify({"hint": "POST /pay with JSON {\"order_id\": 1} or form/query order_id"}), 405

if __name__ == '__main__':
    app.run(port=5003, debug=True)
