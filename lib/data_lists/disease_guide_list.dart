import 'package:vriddhi_0/utilities/all_card_content.dart';

class DiseaseGuideList {
  static final List<CardContentCropGuide> diseaseGuideList = [
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Apple_Blackrot.JPG', title: 'Apple Blackrot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Apple_Cedar_Rust.JPG', title: 'Apple Cedar Rust'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Apple_Scab.JPG', title: 'Apple Scab'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/BellPepper_Bacterial_Spot.JPG', title: 'BellPepper Bacterial Spot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Cherry_Powdery_Mildew.JPG', title: 'Cherry Powdery Mildew'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Grape_Blackrot.JPG', title: 'Grape Blackrot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Grape_Esca.JPG', title: 'Grape Esca.'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Grape_Leaf_Blight.JPG', title: 'Grape Leaf Blight'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Maize_Cercospora.JPG', title: 'Maize Cercospora'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Maize_Common_Rust.JPG', title: 'Maize Common Rust'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Maize_Northern_Leaf_Blight.JPG', title: 'Maize Northern Leaf Blight'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Orange_Citrus_Greening.JPG', title: 'Orange Citrus Greening'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Peach_Bacterial_Spot.JPG', title: 'Peach Bacterial Spot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Potato_Early_Blight.JPG', title: 'Potato Early Blight'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Potato_Late_Blight.JPG', title: 'Potato Late Blight'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Squash_Powdery_Mildew.JPG', title: 'Squash Powdery Mildew'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Strawberry_Leaf_Scorch.JPG', title: 'Strawberry Leaf Scorch'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Bacterial_Spot.JPG', title: 'Tomato Bacterial Spot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Early_Blight.JPG', title: 'Tomato_Early_Blight'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Late_Blight.JPG', title: 'Tomato Late Blight'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Leaf_Mold.JPG', title: 'Tomato Leaf Mold'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Mosaic_Virus.JPG', title: 'Tomato Mosaic Virus'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Septoria_Leaf_Spot.JPG', title: 'Tomato Septoria Leaf Spot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Spider_Mites.JPG', title: 'Tomato Spider Mites'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Target_Spot.JPG', title: 'Tomato Target Spot'),
    CardContentCropGuide(
        imagePath: 'assets/images/plant_diseases/Tomato_Yellow_Leaf_Curl_Virus.JPG', title: 'Tomato Yellow Leaf Curl Virus'),


  ];

  void sortingList(){
    return diseaseGuideList.sort((a, b) => a.title.compareTo(b.title));
  }


}

