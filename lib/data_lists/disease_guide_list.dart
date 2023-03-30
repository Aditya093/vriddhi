import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';

class DiseaseGuideList {
  static final List<DiseaseListTile> diseaseGuideList = [
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Apple_Blackrot.JPG', title: 'Apple Blackrot',id: 1,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Apple_Cedar_Rust.JPG', title: 'Apple Cedar Rust',id: 2,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Apple_Scab.JPG', title: 'Apple Scab',id: 3,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/BellPepper_Bacterial_Spot.JPG', title: 'BellPepper Bacterial Spot',id: 4,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Cherry_Powdery_Mildew.JPG', title: 'Cherry Powdery Mildew',id: 5,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Grape_Blackrot.JPG', title: 'Grape Blackrot',id: 6,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Grape_Esca.JPG', title: 'Grape Esca',id: 7,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Grape_Leaf_Blight.JPG', title: 'Grape Leaf Blight',id: 8,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Maize_Cercospora.JPG', title: 'Maize Cercospora',id: 9,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Maize_Common_Rust.JPG', title: 'Maize Common Rust',id: 10,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Maize_Northern_Leaf_Blight.JPG', title: 'Maize Northern Leaf Blight',id: 11,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Orange_Citrus_Greening.JPG', title: 'Orange Citrus Greening',id: 12,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Peach_Bacterial_Spot.JPG', title: 'Peach Bacterial Spot',id: 13,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Potato_Early_Blight.JPG', title: 'Potato Early Blight',id: 14,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Potato_Late_Blight.JPG', title: 'Potato Late Blight',id: 15,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Squash_Powdery_Mildew.JPG', title: 'Squash Powdery Mildew',id: 16,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Strawberry_Leaf_Scorch.JPG', title: 'Strawberry Leaf Scorch',id: 17,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Bacterial_Spot.JPG', title: 'Tomato Bacterial Spot',id: 18,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Early_Blight.JPG', title: 'Tomato_Early_Blight',id: 19,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Late_Blight.JPG', title: 'Tomato Late Blight',id: 20,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Leaf_Mold.JPG', title: 'Tomato Leaf Mold',id: 21,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Mosaic_Virus.JPG', title: 'Tomato Mosaic Virus',id: 22,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Septoria_Leaf_Spot.JPG', title: 'Tomato Septoria Leaf Spot',id: 23,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Spider_Mites.JPG', title: 'Tomato Spider Mites',id: 24,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Target_Spot.JPG', title: 'Tomato Target Spot',id: 25,),
    DiseaseListTile(
        imagePath: 'assets/images/plant_diseases/Tomato_Yellow_Leaf_Curl_Virus.JPG', title: 'Tomato Yellow Leaf Curl Virus',id: 26,),

  ];

  void sortingList(){
    return diseaseGuideList.sort((a, b) => a.title.compareTo(b.title));
  }
}
