import requests

url = 'http://localhost:5000/predict'
file = {'image': open('test_image.jpg', 'rb')}
response = requests.post(url, files=file)
print(response.json())