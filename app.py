from flask import Flask, request, render_template, send_file, Response, redirect, url_for
from flask_cors import CORS, cross_origin
import pickle
import random
import json
import os
import matlab.engine
eng = matlab.engine.start_matlab()

a = 1

app = Flask(__name__)
CORS(app, support_credentials=True)

class fakefloat(float):
    def __init__(self, value):
        self._value = value
    def __repr__(self):
        return str(self._value)

def defaultencode(o):
    if isinstance(o, Decimal):
        # Subclass float with custom repr?
        return fakefloat(o)
    raise TypeError(repr(o) + " is not JSON serializable")

@app.route('/')
def home():
    return render_template('home.html')

# @app.route('/node_routes', methods=['GET', 'POST'])
# def bestRoute():
#     # Path algorithm here.
#     if request.method == 'POST':
#         print("Started...")
#
#         src = request.json['source']
#         dest = request.json['destination']
#
#         d = {src: dest}
#         d = json.dumps(d)
#
#         return d

@app.route('/final_path', methods=['GET', 'POST'])
def Weights():
    if request.method == 'POST':
        src = request.json['src']
        dest = request.json['dest']
        global a
        print('check1')
        final_path, frame1, frame2, frame4, frame5 = eng.python_matlab_interface(a, src, dest)
        print('check2')
        print(final_path)
        a = a + 1
        return json.dumps({'path':final_path}, default = defaultencode)


if __name__ == '__main__':
    app.run(debug=True)
