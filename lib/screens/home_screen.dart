import 'package:flutter/material.dart';
import 'package:vriddhi_0/data_lists/all_features_list.dart';
import 'package:vriddhi_0/screens/weather_loading_screen.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/heading_row_of_card.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variables
  List<SmallSquareCard> featureList = AllFeaturesList.allFeaturesList;
  //functions
  void onTapped(int index){
    switch(index){
      case 0: {
        Navigator.pushNamed(context, '/crop_classification');
      }
      break;
      case 1: {
        Navigator.pushNamed(context, '/basic_details');
      }
      break;
      case 2: {
        Navigator.pushNamed(context, 'disease_detection');
      }
      break;
      case 3: {
        Navigator.pushNamed(context, '/soil_testing');
      }
      break;
      case 4: {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherLoadingScreen()));
      }
      break;
      case 5: {
        Navigator.pushNamed(context, '/blog_info');
      }
      break;
      case 6: {
        Navigator.pushNamed(context,'/agri_pool');
      }
      break;
      case 7: {
        Navigator.pushNamed(context, '/disease_guide');
      }
      break;
      case 8: {
        Navigator.pushNamed(context, '/news');
      }
      break;
    }

  }

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
                  Navigator.pushNamed(context, '/explore');
                },
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom:0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final current_feature = featureList[index];
                  return SmallSquareCard(title: current_feature.title, imagePath: current_feature.imagePath,onTapCard: () => onTapped(index));
                },
                itemCount: 3,
              ),
            ),

            // Crops + View All
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: HeadingRowOfRectCards(
                heading: 'Crops',
                onTapViewAll: (){
                  Navigator.pushNamed(context, '/crop_guide');
                },
              ),
            ),
            //Crop Cards
            //todo listview builder
            const RectangleCard(
                relatedImagePath: 'assets/images/crops/Crop_Maize.png',
                titleText: 'Maize',
                descriptionText: 'Zea mays',

            ),
            RectangleCard(
                relatedImagePath: 'assets/images/crops/Crop_Rice.png',
                titleText: 'Rice',
                descriptionText: 'Oryza sativa',
              ),
          ],
        ),
      ),
    );
  }
}
