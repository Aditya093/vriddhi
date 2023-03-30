
import 'package:flutter/material.dart';
import 'package:vriddhi_0/screens/weather_screen.dart';

import 'package:vriddhi_0/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//class objects
WeatherModel weather = WeatherModel();


//loading Screen the first screen
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
//Child class of LoadingScreen
class _LoadingScreenState extends State<LoadingScreen> {
  //Variables


  @override
  //Init State
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    var weatherData = await weather.getLocationWeather();
    //Switching to Next Screen Location Screen
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  WeatherScreen(locationWeather: weatherData,)));

  }



  @override
  Widget build(BuildContext context) {
    //Display having a loader only
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}


