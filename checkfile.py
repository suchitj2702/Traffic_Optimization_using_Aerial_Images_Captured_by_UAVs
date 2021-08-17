import requests

r = requests.post('http://127.0.0.1:5000/final_path', json={'src':1, 'dest':4})
print(r.json())
