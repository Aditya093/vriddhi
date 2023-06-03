import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
class AllDataList{
  //CategoriesList for CropClassificationScreen
  static List<Map<String, String>> categoriesList = [
    {
      'display': 'Vegetables',
      'value': 'Vegetable',
    },
    {
      'display': 'Fruits',
      'value': 'Fruit',
    },
    {
      'display': 'Pulses',
      'value': 'Pulses',
    },
    {
      'display': 'Oilseeds and Nuts',
      'value': 'Oilseeds',
    },
    {
      'display': 'Cereals',
      'value': 'Cereals',
    },

    {
      'display': 'Herbs',
      'value': 'Herbs',
    },
    {
      'display': 'Flowers',
      'value': 'Flowers',
    },
  ];

  //Disease Guide List for Disease Guide Screen
  static final List<DiseaseListTile> diseaseGuideList = [
    DiseaseListTile(
      scientific_name: 'Botryosphaeria obtusa', imagePath: 'assets/images/plant_diseases/Apple_Blackrot.JPG', title: 'Apple Blackrot',id: 1,),
    DiseaseListTile(
      scientific_name: 'Gymnosporangium juniperi-virginianae', imagePath: 'assets/images/plant_diseases/Apple_Cedar_Rust.JPG', title: 'Apple Cedar Rust',id: 2,),
    DiseaseListTile(
      scientific_name: 'Venturia inaequalis', imagePath: 'assets/images/plant_diseases/Apple_Scab.JPG', title: 'Apple Scab',id: 3,),
    DiseaseListTile(
      scientific_name: 'Xanthomonas campestris pv. vesicatoria', imagePath: 'assets/images/plant_diseases/BellPepper_Bacterial_Spot.JPG', title: 'BellPepper Bacterial Spot',id: 4,),
    DiseaseListTile(
      scientific_name: 'Podosphaera clandestina', imagePath: 'assets/images/plant_diseases/Cherry_Powdery_Mildew.JPG', title: 'Cherry Powdery Mildew',id: 5,),
    DiseaseListTile(
      scientific_name: 'Guignardia bidwellii', imagePath: 'assets/images/plant_diseases/Grape_Blackrot.JPG', title: 'Grape Blackrot',id: 6,),
    DiseaseListTile(
      scientific_name: 'Black measles', imagePath: 'assets/images/plant_diseases/Grape_Esca.JPG', title: 'Grape Esca',id: 7,),
    DiseaseListTile(
      scientific_name: 'Phomopsis viticola', imagePath: 'assets/images/plant_diseases/Grape_Leaf_Blight.JPG', title: 'Grape Leaf Blight',id: 8,),
    DiseaseListTile(
      scientific_name: 'Cercospora zeae-maydis', imagePath: 'assets/images/plant_diseases/Maize_Cercospora.JPG', title: 'Maize Cercospora',id: 9,),
    DiseaseListTile(
      scientific_name: 'Puccinia sorghi', imagePath: 'assets/images/plant_diseases/Maize_Common_Rust.JPG', title: 'Maize Common Rust',id: 10,),
    DiseaseListTile(
      scientific_name: 'Exserohilum turcicum', imagePath: 'assets/images/plant_diseases/Maize_Northern_Leaf_Blight.JPG', title: 'Maize Northern Leaf Blight',id: 11,),
    DiseaseListTile(
      scientific_name: 'Candidatus Liberibacter asiaticus', imagePath: 'assets/images/plant_diseases/Orange_Citrus_Greening.JPG', title: 'Orange Citrus Greening',id: 12,),
    DiseaseListTile(
      scientific_name: 'Xanthomonas arboricola pv. pruni', imagePath: 'assets/images/plant_diseases/Peach_Bacterial_Spot.JPG', title: 'Peach Bacterial Spot',id: 13,),
    DiseaseListTile(
      scientific_name: 'Alternaria solani', imagePath: 'assets/images/plant_diseases/Potato_Early_Blight.JPG', title: 'Potato Early Blight',id: 14,),
    DiseaseListTile(
      scientific_name: 'Phytophthora infestans', imagePath: 'assets/images/plant_diseases/Potato_Late_Blight.JPG', title: 'Potato Late Blight',id: 15,),
    DiseaseListTile(
      scientific_name: 'Podosphaera xanthii', imagePath: 'assets/images/plant_diseases/Squash_Powdery_Mildew.JPG', title: 'Squash Powdery Mildew',id: 16,),
    DiseaseListTile(
      scientific_name: 'Diplocarpon earliana', imagePath: 'assets/images/plant_diseases/Strawberry_Leaf_Scorch.JPG', title: 'Strawberry Leaf Scorch',id: 17,),
    DiseaseListTile(
      scientific_name: 'Xanthomonas campestris pv. vesicatoria', imagePath: 'assets/images/plant_diseases/Tomato_Bacterial_Spot.JPG', title: 'Tomato Bacterial Spot',id: 18,),
    DiseaseListTile(
      scientific_name: 'Alternaria linariae', imagePath: 'assets/images/plant_diseases/Tomato_Early_Blight.JPG', title: 'Tomato_Early_Blight',id: 19,),
    DiseaseListTile(
      scientific_name: 'Phytophthora infestans', imagePath: 'assets/images/plant_diseases/Tomato_Late_Blight.JPG', title: 'Tomato Late Blight',id: 20,),
    DiseaseListTile(
      scientific_name: 'Passalora fulva', imagePath: 'assets/images/plant_diseases/Tomato_Leaf_Mold.JPG', title: 'Tomato Leaf Mold',id: 21,),
    DiseaseListTile(
      scientific_name: 'ToMV', imagePath: 'assets/images/plant_diseases/Tomato_Mosaic_Virus.JPG', title: 'Tomato Mosaic Virus',id: 22,),
    DiseaseListTile(
      scientific_name: 'Septoria lycopersici', imagePath: 'assets/images/plant_diseases/Tomato_Septoria_Leaf_Spot.JPG', title: 'Tomato Septoria Leaf Spot',id: 23,),
    DiseaseListTile(
      scientific_name: 'Tetranychus urticae', imagePath: 'assets/images/plant_diseases/Tomato_Spider_Mites.JPG', title: 'Tomato Spider Mites',id: 24,),
    DiseaseListTile(
      scientific_name: 'Corynespora cassiicola', imagePath: 'assets/images/plant_diseases/Tomato_Target_Spot.JPG', title: 'Tomato Target Spot',id: 25,),
    DiseaseListTile(
      scientific_name: 'TYLCV', imagePath: 'assets/images/plant_diseases/Tomato_Yellow_Leaf_Curl_Virus.JPG', title: 'Tomato Yellow Leaf Curl Virus',id: 26,),
  ];
  //Sorting for DiseaseList
  void diseaseListSorting(){
    return diseaseGuideList.sort((a, b) => a.title.compareTo(b.title));
  }

  //All Features List for Explore Screen
  static final List<SmallSquareCard> allFeaturesList = [
    SmallSquareCard(
      title: 'Crop\nBook',
      imagePath: 'assets/images/feature_icons/Feature_CropGuide.png',
    ),
    SmallSquareCard(
      title: 'Predict\nCrop',
      imagePath: 'assets/images/feature_icons/Feature_Crop.png',
    ),
    SmallSquareCard(
      title: 'Disease\nDetection',
      imagePath: 'assets/images/feature_icons/Feature_Disease_Prediction.png',
    ),
    // SmallSquareCard(
    //   title: 'Soil\nTesting',
    //   imagePath: 'assets/images/feature_icons/Feature_SoilTesting.png',
    // ),
    SmallSquareCard(
      title: 'Weather\nForecast',
      imagePath: 'assets/images/feature_icons/Feature_Weather.png',
    ),
    SmallSquareCard(
      title: 'Blog\nInfo',
      imagePath: 'assets/images/feature_icons/Feature_Blog.png',
    ),
    SmallSquareCard(
      title: 'Agri \nPool',
      imagePath: 'assets/images/feature_icons/Feature_AgriPool.png',
    ),
    SmallSquareCard(
      title: 'Disease\nGuide',
      imagePath: 'assets/images/feature_icons/Feature_DiseaseGuide.png',
    ),
    SmallSquareCard(
      title: 'News\nFeed',
      imagePath: 'assets/images/feature_icons/Feature_News.png',
    ),
    SmallSquareCard(
      title: 'Farming\nTechniques',
      imagePath: 'assets/images/feature_icons/Feature_Gardening.png',
    ),
  ];

  //AgriPool Features List for Agri Pool Screen
  static final List<SmallSquareCard> agripoolfeatures = [
    SmallSquareCard(
      title: 'Leaves',
      imagePath: 'assets/images/pool_features/Pool_Leaves.png',
    ),
    SmallSquareCard(
      title: 'Diseases',
      imagePath: 'assets/images/pool_features/Pool_Diseases.png',
    ),
    SmallSquareCard(
      title: 'Seeds',
      imagePath: 'assets/images/pool_features/Pool_Seeds.png',
    ),
    SmallSquareCard(
      title: 'Plants',
      imagePath: 'assets/images/pool_features/Pool_Plants.png',
    ),

  ];

  static final List<String> cropsNameList=["Apple",
    "Avocado",
    "Banana",
    "Beetroot",
    "Bell Pepper",
    "Blackgram",
    "Blueberry",
    "Bok Choy",
    "Brinjal",
    "Broccoli",
    "Cabbage",
    "Carrot",
    "Cauliflower",
    "Chickpea",
    "Chilli",
    "Coconut",
    "Coffee",
    "Cotton seeds",
    "Cranberry",
    "Custard Apple",
    "Dragon Fruit",
    "Fenugreek",
    "Grapes",
    "Guava",
    "Kale",
    "Kidneybeans",
    "Lentil",
    "Lettuce",
    "Maize",
    "Mango",
    "Mothbeans",
    "Mungbean",
    "Muskmelon",
    "Okra",
    "Onion",
    "Orange",
    "Papaya",
    "Peach",
    "Peas",
    "Pine Apple",
    "Pomegranate",
    "Potato",
    "Radish",
    "Redgram",
    "Rice",
    "Spinach",
    "Strawberry",
    "Tomato",
    "Turnip",
    "Watermelon",
    "Wheat"];

}
