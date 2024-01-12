#!/usr/bin/env python
import os

from flask import Flask
# from pymongo import MongoClient

app = Flask(__name__)

# client = MongoClient("mongo:27017")

@app.route('/')
def hello_world():
    # try:
    #     client.admin.command('ismaster')
    # except:
    #     return "Server not available"
    return "Hello from the MongoDB client!\n"


if __name__ == "__main__":
    app.run(debug=True)

