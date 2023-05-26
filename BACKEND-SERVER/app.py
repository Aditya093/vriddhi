from flask import Flask, request, jsonify
import tensorflow as tf
import numpy as np
from keras.preprocessing import image
from werkzeug.utils import secure_filename
import os
import pytesseract
import cv2
import re
from keras.utils import img_to_array,load_img
pytesseract.pytesseract.tesseract_cmd = r'C:/Program Files/Tesseract-OCR/tesseract.exe'
from keras.applications.vgg19 import preprocess_input
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'UPLOADS')
@app.route("/",methods=['GET'])
def home():
    return jsonify("Hello World")


def word_extracter(text):
    # Define regular expressions to match the values of N, P, K, and pH
    n_regex = r"N:(\d+)"
    p_regex = r"P:(\d+)"
    k_regex = r"K:(\d+)"
    ph_regex = r"ph:\s+(\d+\.\d+)"

    # Use regular expressions to extract the values of N, P, K, and pH
    n_match = re.search(n_regex, text)
    p_match = re.search(p_regex, text)
    k_match = re.search(k_regex, text)
    ph_match = re.search(ph_regex, text)
    print(n_match)
    data = {
        "N":float(n_match.group(1)),
        "P":float(p_match.group(1)),
        "K":float(k_match.group(1)),
        "ph":float(ph_match.group(1)),
        
    }
    return data



model = tf.keras.models.load_model('crop_model.h5')
imgmodel = tf.keras.models.load_model('best_model.h5')
noleafmodel = tf.keras.models.load_model('noleaf.h5')
print("best_model (1) (1).h5")
# Crop Recommendation API endpoint
@app.route('/crop', methods=['POST'])
def crop():
    data = request.get_json()

    nitrogen = data['N']
    phosphorus = data['P']
    potassium = data['K']
    temperature = data['temperature']
    humidity = data['humidity']
    rainfall = data['rainfall']
    ph = data['ph']

    input_data = np.array([[nitrogen, phosphorus, potassium, temperature, humidity, ph,rainfall]])

    pred = model.predict(input_data)
    top_1=np.argmax(pred)
    probs=pred.max(axis=1)
    k = 5
    top_k_indices = np.argsort(pred,axis=1)[:, -k:][:, ::-1]
    crop_mapper = {0: 'apple',
        1: 'banana',
        2: 'blackgram',
        3: 'chickpea',
        4: 'coconut',
        5: 'coffee',
        6: 'cotton',
        7: 'grapes',
        8: 'jute',
        9: 'kidneybeans',
        10: 'lentil',
        11: 'maize',
        12: 'mango',
        13: 'mothbeans',
        14: 'mungbean',
        15: 'muskmelon',
        16: 'orange',
        17: 'papaya',
        18: 'pigeonpeas',
        19: 'pomegranate',
        20: 'rice',
        21: 'watermelon'}
    recom = {"crop_1":crop_mapper[top_k_indices[0][0]],
             "crop_1_probs":str(probs[0]),
             "crop_1_id":str(top_k_indices[0][0])}
    return jsonify(recom)




# Define endpoint for POST request
@app.route('/predict', methods=['POST'])
def predict():
    file = request.files['image']
    filename = secure_filename(file.filename)
    file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
    
    img = load_img(os.path.join(app.config['UPLOAD_FOLDER'], filename), target_size=(256, 256))
    img=img.resize((256,256))
    x = img_to_array(img)
    im = x
    im=preprocess_input(x)
    im = np.expand_dims(im, axis=0)
    preds=noleafmodel.predict(im)
    preds=preds.argmax(axis=-1)[0]
    if preds==1:
        result = {'class1': 'The Object is either not a leaf or image is blurry.'}
        return jsonify(result)
    prediction = imgmodel.predict(im)[0]
    pred_indices = prediction.argsort()[-15:][::-1]
    print(pred_indices)
    key_list=['Apple__Apple_scab', 'Apple_Black_rot', 'Apple_Cedar_apple_rust', 'Apple_healthy', 'Blueberry_healthy', 'Cherry(including_sour)__Powdery_mildew', 'Cherry(including_sour)__healthy', 'Corn(maize)__Cercospora_leaf_spot Gray_leaf_spot', 'Corn(maize)__Common_rust', 'Corn_(maize)__Northern_Leaf_Blight', 'Corn(maize)__healthy', 'Grape_Black_rot', 'Grape_Esca(Black_Measles)', 'Grape__Leaf_blight(Isariopsis_Leaf_Spot)', 'Grape__healthy', 'Orange_Haunglongbing(Citrus_greening)', 'Peach__Bacterial_spot', 'Peach_healthy', 'Pepper,_bell_Bacterial_spot', 'Pepper,_bell_healthy', 'Potato_Early_blight', 'Potato_Late_blight', 'Potato_healthy', 'Raspberry_healthy', 'Soybean_healthy', 'Squash_Powdery_mildew', 'Strawberry_Leaf_scorch', 'Strawberry_healthy', 'Tomato_Bacterial_spot', 'Tomato_Early_blight', 'Tomato_Late_blight', 'Tomato_Leaf_Mold', 'Tomato_Septoria_leaf_spot', 'Tomato_Spider_mites Two-spotted_spider_mite', 'Tomato_Target_Spot', 'Tomato_Tomato_Yellow_Leaf_Curl_Virus', 'Tomato_Tomato_mosaic_virus', 'Tomato__healthy']
    result = {'class1': key_list[pred_indices[0]]}
    
    return jsonify(result)



# Crop Recommendation API endpoint
@app.route('/cropreport', methods=['POST'])
def cropreport():
    #data = request.get_json()
    file = request.files['image']
    filename = secure_filename(file.filename)
    file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
    img = cv2.imread(os.path.join(app.config['UPLOAD_FOLDER'], filename))
    temperature = float(request.form['temperature'])
    humidity = float(request.form['humidity'])
    rainfall = float(request.form['rainfall'])
    
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    #noise removal
    noise=cv2.medianBlur(gray,3)
    # thresholding# converting it to binary image by Thresholding
    # this step is require if you have colored image because if you skip this part
    # then tesseract won’t able to detect text correctly and this will give incorrect #result
    thresh = cv2.threshold(noise, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)[1]
    #Configuration
    config = ('-l eng — oem 3 — psm 3')
    # pytessercat
    text = pytesseract.image_to_string(thresh,config=config)
    print(text)
    dt = word_extracter(text)
    input_data = np.array([[dt["N"], dt["P"], dt["K"], temperature, humidity, dt["ph"],rainfall]])

    pred = model.predict(input_data)
    top_1=np.argmax(pred)
    probs=pred.max(axis=1)
    k = 5
    top_k_indices = np.argsort(pred,axis=1)[:, -k:][:, ::-1]
    crop_mapper = {0: 'apple',
        1: 'banana',
        2: 'blackgram',
        3: 'chickpea',
        4: 'coconut',
        5: 'coffee',
        6: 'cotton',
        7: 'grapes',
        8: 'jute',
        9: 'kidneybeans',
        10: 'lentil',
        11: 'maize',
        12: 'mango',
        13: 'mothbeans',
        14: 'mungbean',
        15: 'muskmelon',
        16: 'orange',
        17: 'papaya',
        18: 'pigeonpeas',
        19: 'pomegranate',
        20: 'rice',
        21: 'watermelon'}
    recom = {"crop_1":crop_mapper[top_k_indices[0][0]],
             "crop_1_probs":str(probs[0]),
             "crop_1_id":str(top_k_indices[0][0])}
    return jsonify(recom)
    
    

if __name__ == '__main__':
    app.run(debug=True)