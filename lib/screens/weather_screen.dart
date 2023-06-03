import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/location_data.dart';
import 'package:vriddhi_0/global_listeners/temperature_data.dart';
import 'package:vriddhi_0/services/get_current_date.dart';
import 'package:vriddhi_0/services/weather.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

WeatherModel weatherModel = WeatherModel();

class WeatherScreen extends StatefulWidget {
  static const String id = 'weather_screen';
  //Constructor
  WeatherScreen({@required this.locationWeather});
  final locationWeather;
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late int temperature;
  late int wind;
  late int humidity;
  late int rain;
   late String cityName;
  bool isLoading = true;
  // late int rain;
   late String condition;
  @override
  void initState() {
    super.initState();
    initializeWeather();
  }

  Future<void> initializeWeather() async{
    await updateUI();
  }
  //Updating text fields by fetching api data
  Future<void> updateUI() async{
    try{
      // await weatherModel.setWeatherParameters(context);
      final temperatureData =  Provider.of<WeatherDataAll>(context,listen: false);
      final locationData =  Provider.of<LocationData>(context,listen: false);

      temperature = temperatureData.temperature;
      humidity = temperatureData.humidity;
      rain = temperatureData.rain;
      wind = temperatureData.wind;
      cityName = locationData.location;
      condition = temperatureData.condition;
      setState(() {
        isLoading = false;
      });
    }catch(e){
      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: ReusableWidgets.smallAppBar('Weather'),
        body: isLoading == false ? Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment,
            children: [
              //Heading Location (Icon + text)
              SizedBox(
                // color: Colors.blue,
                height: 35,
                // alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.location_on,
                        color: kPrimaryGreenColor,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    //Current Location
                    Text(
                      '$cityName',
                      style: kTitleOfInfoCardsTS,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Card(
                  color: kLightTealCardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Image.asset(
                          'assets/images/weather/Weather_Cloudy.png',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        flex: 2,
                        child: Container(
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Text(
                                '${CurrentDate.getCurrentDateWithDay()}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '$temperature°',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                              Text('$condition' , style: kTitleOfInfoCardsTS,),
                            ],
                          ),
                        ),),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0),
              //   child: Align(alignment: Alignment.centerLeft,child: Text('Thunderstorm' , style: kTitleOfInfoCardsTS,)),
              // ),
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.blue,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: [
                      SmallWeatherSpecsCard(title: '$humidity', icon: FontAwesomeIcons.droplet, subtitle: 'Humidity'),
                      SmallWeatherSpecsCard(title: '$rain', icon: FontAwesomeIcons.cloudShowersHeavy, subtitle: 'Rain'),
                      SmallWeatherSpecsCard(title: '$wind', icon: FontAwesomeIcons.wind, subtitle: 'Wind'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ) : kLoader,
      ),
    );
  }
}

