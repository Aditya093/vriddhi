import 'package:flutter/material.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/screens/disease_detection_screen.dart';
import 'package:vriddhi_0/screens/explore_screen.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/heading_row_of_card.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            //Overlapped App bar and Weather container
            StackedAppAndBox(
              boxCardContent: CardContentWeather(),
            ),
            //Explore + View All
            Padding(

              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: HeadingRowOfRectCards(
                heading: 'Explore',
                onTapViewAll: () {
                  Navigator.pushNamed(context, ExploreScreen.id);
                },
              ),
            ),

            const SizedBox(
              height: 10,
            ),

             RectangleCard(
                relatedImagePath:
                    'assets/images/feature_icons/Feature_CropGuide.png',
                titleText: 'Crop Book',
                onTapped: (){Navigator.pushNamed(context, CropGuideScreen.id);},
                descriptionText: 'An extensive guide of crops',
              ),

             RectangleCard(
                relatedImagePath:
                    'assets/images/feature_icons/Feature_Disease_Prediction.png',
                titleText: 'Disease Detection',
                descriptionText: 'Detect the disease of the crop',
                onTapped:  (){Navigator.pushNamed(context, DiseaseDetectionScreen.id);},
            ),
             RectangleCard(
                relatedImagePath:
                    'assets/images/feature_icons/Feature_Crop.png',
                titleText: 'Predict Crop',
                descriptionText: 'Predict the most suitable crop for land',
                onTapped:  (){Navigator.pushNamed(context, BasicDetailsScreen.id);},

             ),
            //Crops + View All
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: HeadingRowOfRectCards(
                heading: 'Crops',
                onTapViewAll: (){
                  Navigator.pushNamed(context, CropGuideScreen.id);
                },
              ),
            ),
            //Crop Cards
            //todo listview builder
            const RectangleCard(
                relatedImagePath: 'assets/images/crops/Crop_Maize.png',
                titleText: 'Maize',
                descriptionText: '',

            ),
            RectangleCard(
                relatedImagePath: 'assets/images/crops/Crop_Rice.png',
                titleText: 'Rice',
                descriptionText: '',
              ),
          ],
        ),
      ),
    );
  }
}
