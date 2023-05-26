import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/all_features_list.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/blog_info_screen.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/screens/disease_detection_screen.dart';
import 'package:vriddhi_0/screens/disease_guide_screen.dart';
import 'package:vriddhi_0/screens/farming_techniques_screen.dart';
import 'package:vriddhi_0/screens/loading_screen.dart';
import 'package:vriddhi_0/screens/news_screen.dart';
import 'package:vriddhi_0/screens/soil_testing_screen.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';
import 'package:vriddhi_0/screens/agripool_screen.dart';

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
        Navigator.pushNamed(context, SoilTestingScreen.id);
      }
      break;
      case 4: {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
      }
      break;
      case 5: {
        Navigator.pushNamed(context, BlogInfoScreen.id);
      }
      break;
      case 6: {
        Navigator.pushNamed(context, AgriPoolScreen.id);
      }
      break;
      case 7: {
        Navigator.pushNamed(context, DiseaseGuideScreen.id);
      }
      break;
      case 8: {
        Navigator.pushNamed(context, NewsScreen.id);
      }
      break;
      case 9: {
        Navigator.pushNamed(context, FarmingTechniquesScreen.id);
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
            physics: NeverScrollableScrollPhysics(),
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




