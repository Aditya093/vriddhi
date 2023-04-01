from flask import Flask, request, jsonify
app = Flask(__name__)
#app.config['UPLOAD_FOLDER'] = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'UPLOADS')
@app.route("/",methods=['GET'])
def home():
    return jsonify("Hello World")
if __name__ == '__main__':
    app.run(debug=True)