import 'package:vriddhi_0/utilities/all_card_content.dart';

class CropGuideList {
  static final List<CardContentCropGuide> cropGuideList = [
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Apple.png', title: 'Apple', id: 0,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Banana.png', title: 'Banana', id: 1,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Blackgram.png',
        title: 'Blackgram',id: 2,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Chickpea.png', title: 'Chickpea',id: 3,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Coconut.png', title: 'Coconut', id: 4,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Coffee.png', title: 'Coffee',id: 5,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Cotton.png', title: 'Cotton',id: 6,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Grapes.png', title: 'Grapes',id: 7,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Jute.png', title: 'Jute',id: 8,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_KidneyBeans.png',
        title: 'Kidney Beans', id: 9,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Lentil.png', title: 'Lentil',id: 10,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Maize.png', title: 'Maize',id: 11,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Mango.png', title: 'Mango',id: 12,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Mothbeans.png',
        title: 'Mothbeans',id: 13,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Mungbean.png',
        title: 'Mungbeans',id: 14,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Muskmelon.png',
        title: 'Muskmelon',id: 15,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Orange.png', title: 'Orange',id: 16,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Papaya.png', title: 'Papaya',id: 17,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_PigeonPeas.png',
        title: 'Pigeon Peas',id: 18,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Pomegranate.png',
        title: 'Pomegranate',id: 19,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Rice.png', title: 'Rice',id: 20,),
    CardContentCropGuide(imagePath: 'assets/images/crops/Crop_Watermelon.png',
        title: 'Watermelon',id: 21,),
    CardContentCropGuide(
        imagePath: 'assets/images/crops/Crop_Wheat.png', title: 'Wheat',id: 22,),
  ];

  void sortingList(){
    return cropGuideList.sort((a, b) => a.title.compareTo(b.title));
  }


}
