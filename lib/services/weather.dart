import 'package:flutter/material.dart';
import 'package:vriddhi_0/services/location.dart';
import 'networking.dart';

const apiKey = 'ab03e6edb28aead4fecad12e724e8e51';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  //Getting Weather Data by City Name
  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url:'$openWeatherMap?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  //Getting Location data through location.dart and networking.dart
  Future<dynamic> getLocationWeather() async {
    //getting current location
    Location location = Location();
    await location.getCurrentLocation();
    //networking through open weather map api
    NetworkHelper networkHelper = NetworkHelper(url:'$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
     }
}

