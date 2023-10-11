
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return "Index!"

@app.route('/hello/<name>', methods=['GET'])
def hello(name):
    return "hello, " + str(name)

@app.route('/calculate/<num1>/<num2>', methods=['GET'])
def calculate(num1, num2):
    try:
        num1 = eval(num1)
        num2 = int(num2)

        results = {
                'plus' : num1 + num2,
                'minus' : num1 - num2,
                'multiply': num1 * num2,
                'divide' : num1 / num2,
                'mod' : num1 % num2,
                'is_prime num1' : is_prime(num1),
                'is_prime num2' : is_prime(num2),
                'is_prime num1 + num2' : is_prime(num1 + num2),
            }
    except:
        results = { 'error_msg' : 'inputs must be numbers' }

    return jsonify(results)

@app.route('/is_prime/<number>', methods=['GET'])
def is_prime(number):
    if number <= 1:
        return False
    if number <= 3:
        return True
    if number % 2 == 0 or number % 3 == 0:
        return False

    i = 5
    while i * i <= number:
        if number % i == 0 or number % (i + 2) == 0:
            return False
        i += 6

    return True

if __name__ == '__main__':
    app.run()
