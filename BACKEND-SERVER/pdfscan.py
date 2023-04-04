import cv2
from PIL import Image
import re
def mark_region(imagE_path):
    
    im = cv2.imread(image_path)

    gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
    blur = cv2.GaussianBlur(gray, (9,9), 0)
    thresh = cv2.adaptiveThreshold(blur,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV,11,30)

    # Dilate to combine adjacent text contours
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (9,9))
    dilate = cv2.dilate(thresh, kernel, iterations=4)

    # Find contours, highlight text areas, and extract ROIs
    cnts = cv2.findContours(dilate, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    cnts = cnts[0] if len(cnts) == 2 else cnts[1]

    line_items_coordinates = []
    for c in cnts:
        area = cv2.contourArea(c)
        x,y,w,h = cv2.boundingRect(c)

        if y >= 600 and x <= 1000:
            if area > 10000:
                image = cv2.rectangle(im, (x,y), (2200, y+h), color=(255,0,255), thickness=3)
                line_items_coordinates.append([(x,y), (2200, y+h)])

        if y >= 2400 and x<= 2000:
            image = cv2.rectangle(im, (x,y), (2200, y+h), color=(255,0,255), thickness=3)
            line_items_coordinates.append([(x,y), (2200, y+h)])


    return image, line_items_coordinates


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

    data = {
        "N":float(n_match.group(1)),
        "P":float(p_match.group(1)),
        "K":float(k_match.group(1)),
        "ph":float(ph_match.group(1)),
        
    }
    return data
import pytesseract
import cv2
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
img = cv2.imread('Test.png')
# get grayscale image
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
print(word_extracter(text))
