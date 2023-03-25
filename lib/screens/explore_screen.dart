import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/all_features_list.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/screens/disease_detection_screen.dart';
import 'package:vriddhi_0/screens/weather_screen.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class ExploreScreen extends StatefulWidget {
  static final String id = 'explore_screen';
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  void onTapped(int index){
    switch(index){
      case 0: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
      case 1: {
        Navigator.pushNamed(context, BasicDetailsScreen.id);
      }
      break;
      case 2: {
        Navigator.pushNamed(context, DiseaseDetectionScreen.id);
      }
      break;
      case 3: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
      case 4: {
        Navigator.pushNamed(context, WeatherScreen.id);
      }
      break;
      case 5: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
      case 6: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
      case 7: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
      case 8: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
      case 9: {
        Navigator.pushNamed(context, CropGuideScreen.id);
      }
      break;
    }

  }

  List<SmallSquareCard> featureList = AllFeaturesList.allFeaturesList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: ReusableWidgets.smallAppBar('Explore'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8
            ),
            itemBuilder: (BuildContext context, int index) {

              final current_feature = featureList[index];
              return SmallSquareCard(title: current_feature.title, imagePath: current_feature.imagePath,onTapCard: () => onTapped(index));
            },
            itemCount: featureList.length,
          ),
        ),
      ),
    );
  }
}




