import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/global_listeners/location_data.dart';
import 'package:vriddhi_0/global_listeners/temperature_data.dart';
import 'package:vriddhi_0/services/location.dart';
import 'networking.dart';

const apiKeyForTH = 'ab03e6edb28aead4fecad12e724e8e51';
const apiKeyForR = 'cae36ea482bc448686492930230106';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';
const weatherapi = 'http://api.weatherapi.com/v1/current.json';

class WeatherModel {
  //Getting Weather Data by City Name
  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url:'$openWeatherMap?q=$cityName&appid=$apiKeyForTH&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Future<void> setCurrentTemperature(BuildContext context) async{
  //   var weatherData =await getLocationWeather();
  //
  //   //setting the temperature in provider
  //   final weatherDataTemp = Provider.of<WeatherDataAll>(context, listen: false);
  // }

  Future<void> setWeatherParameters(BuildContext context) async{
    var weatherData =await getLocationWeather();
    var weatherData2 =await getLocationWeatherForRain();
    dynamic temp = weatherData['main']['temp'];
    int temperature = temp.toInt();
    dynamic humid = weatherData['main']['humidity'];
    int humidity = humid.toInt();
    dynamic rain = weatherData2['current']['precip_mm'];
    int rain2 = rain.toInt();
    dynamic wind = weatherData['wind']['speed'];
    int wind2 = wind.toInt();
    String cityName = weatherData['name'];
    var condition = weatherData['weather'][0]['main'];
    String cond = condition;
    var condition_id=weatherData['weather'][0]['id'];
    //setting the temperature in provider
    final weatherDataTemp = Provider.of<WeatherDataAll>(context, listen: false);
    final locationData = Provider.of<LocationData>(context, listen: false);
    weatherDataTemp.setHumidity(humidity);
    weatherDataTemp.setRain(rain2);
    weatherDataTemp.setWind(wind2);
    weatherDataTemp.setCondition(cond);
    locationData.setLocation(cityName);
    weatherDataTemp.setTemperature(temperature);
    weatherDataTemp.setCondition_Id(condition_id);
  }





  //Getting Location data through location.dart and networking.dart
  Future<dynamic> getLocationWeather() async {
    //getting current location
    Location location = Location();
    await location.getCurrentLocation();
    //networking through open weather map api
    NetworkHelper networkHelper = NetworkHelper(url:'$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKeyForTH&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeatherForRain() async {
    //getting current location
    Location location = Location();
    await location.getCurrentLocation();
    //networking through open weather map api
    NetworkHelper networkHelper = NetworkHelper(url:'$weatherapi?key=$apiKeyForR&q=${location.latitude},${location.longitude}&aqi=no');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

}

