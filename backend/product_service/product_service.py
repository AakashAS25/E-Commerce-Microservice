from flask import Flask, jsonify
app = Flask(__name__)

products = [
    {"id": 1, "name": "T-shirt", "price": 299},
    {"id": 2, "name": "Jeans", "price": 799},
    {"id": 3, "name": "Sneakers", "price": 1499}
]

@app.route('/products', methods=['GET'])
def get_products():
    return jsonify(products)

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Product Service API", "endpoints": ["/products", "/healthz"]})

@app.route('/healthz', methods=['GET'])
def healthz():
    return jsonify({"status": "ok"})

if __name__ == '__main__':
     app.run(host='0.0.0.0', port=5001, debug=True)
