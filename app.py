#!/usr/bin/env python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Udacity!\n"

if __name__ == "__main__":
    app.run(host='0.0.0.0')