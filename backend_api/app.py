from flask import Flask, request, render_template, send_file, Response, redirect, url_for
from flask_cors import CORS, cross_origin
import pickle
import random
import json
import os
from PIL import Image
import numpy as np
from camera1 import VideoCamera1
from camera2 import VideoCamera2

app = Flask(__name__)
CORS(app, support_credentials=True)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/node_routes', methods=['GET', 'POST'])
def bestRoute():
    # Path algorithm here.
    if request.method == 'POST':
        print("Started...")

        src = request.form['source']
        dest = request.form['destination']

        d = {src: dest}
        d = json.dumps(d)

        return d

def randomWeights():
    if request.method == 'GET':
        cwd = os.getcwd()
        addr = os.path.join(os.path.dirname(__file__), 'images')
        os.chdir(addr)


cronjob.add_job(run, 'interval', seconds=5)
if __name__ == '__main__':
    cronjob.start()
    app.run(host = '0.0.0.0', debug=True)
