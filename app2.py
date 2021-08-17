from flask import Flask, request
import matlab.engine
import json
from decimal import Decimal

app = Flask(__name__)

eng = matlab.engine.start_matlab()

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

@app.route('/path_algo', methods=['GET', 'POST'])
def pathalgo():
	if request.method == 'POST':
		day = request.json['day']
		time = request.json['time']
		threshold = request.json['threshold']
		#threshold = matlab.uint8(list(threshold.getdata()))
		print(type(day))
		print()
		print(day)

		result = str(eng.trafficTime(day, time, threshold))
		d = {'result':  result}
		return json.dumps(d, default = defaultencode)


if __name__ == '__main__':
	app.run(debug=True)
