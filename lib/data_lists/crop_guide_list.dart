import 'package:vriddhi_0/utilities/all_card_content.dart';

class CropGuideList {
  static final List<CardContentCropGuide> cropGuideList = [
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Apple.png', title: 'Apple'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Banana.png', title: 'Banana'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Blackgram.png',
        title: 'Blackgram'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Chickpea.png', title: 'Chickpea'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Coconut.png', title: 'Coconut'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Coffee.png', title: 'Coffee'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Cotton.png', title: 'Cotton'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Grapes.png', title: 'Grapes'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Jute.png', title: 'Jute'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Kidneybeans.png',
        title: 'Kidney Beans'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Lentil.png', title: 'Lentil'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Maize.png', title: 'Maize'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Mango.png', title: 'Mango'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Mothbeans.png',
        title: 'Mothbeans'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Mungbeans.png',
        title: 'Mungbeans'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Muskmelon.png',
        title: 'Muskmelon'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Orange.png', title: 'Orange'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Papaya.png', title: 'Papaya'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Pigeonbeans.png',
        title: 'Pigeonbeans'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Pomegranate.png',
        title: 'Pomegranate'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Rice.png', title: 'Rice'),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Watermelon.png',
        title: 'Watermelon'),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Wheat.png', title: 'Wheat'),
  ];

  void sortingList(){
    return cropGuideList.sort((a, b) => a.title.compareTo(b.title));
  }


}
