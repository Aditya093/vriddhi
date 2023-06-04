import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/allDataList.dart';
import 'package:vriddhi_0/main.dart';
import 'package:vriddhi_0/services/weather.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/heading_row_of_card.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';

//class objects
WeatherModel weatherModel = WeatherModel();

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variables
  List<SmallSquareCard> featureList = AllDataList.allFeaturesList;
  bool showSpinner = true;
  //functions
  void onTapped(int index) {
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(context, '/basic_details');
        }
        break;
      case 1:
        {
          Navigator.pushNamed(context, '/disease_detection');
        }
        break;
      case 2:
        {
          Navigator.pushNamed(context, '/weather');
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    updateTemp();

  }

  Future<void> updateTemp() async {
    await weatherModel.setWeatherParameters(context);
    await userData.username;
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSpinner == false
        ? SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    //Overlapped App bar and Weather container
                    StackedAppAndBox(
                      boxCardContent: CardContentWeather(),
                    ),
                    //Explore + View All
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: HeadingRowOfRectCards(
                        heading: 'Explore',
                        onTapViewAll: () {
                          Navigator.pushNamed(context, '/explore');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),

                        itemBuilder: (BuildContext context, int index) {
                          final current_feature = featureList[index+1];

                          return GestureDetector(
                            onTap: ()=> onTapped(index),
                            child: RectangleCard
                              (
                                   relatedImagePath: current_feature.imagePath, titleText: current_feature.title,

                            ),
                          );
                          },
                        itemCount: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SpinKitDoubleBounce(
            size: 100.0,
            color: kPrimaryAppColor,
          );
  }
}


