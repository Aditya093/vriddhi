import 'package:flutter/material.dart';

class WeatherDataAll extends ChangeNotifier {
  int _temperature = 0;
  int _wind = 0;
  int _humidity = 0;
  int _rain  = 0;
  String _condition = '';

  int get temperature => _temperature;
  int get humidity=>_humidity;
  int get wind =>_wind;
  int get rain =>_rain;
  String get condition => _condition;

  void setTemperature(int temperature) {
    _temperature = temperature;
    notifyListeners();
  }
  void setHumidity(int humidity) {
    _humidity = humidity;
    notifyListeners();
  }
  void setWind(int wind) {
    _wind = wind;
    notifyListeners();
  }
  void setRain(int rain) {
    _rain = rain;
    notifyListeners();
  }
  void setCondition(String cond){
    _condition = cond;
    notifyListeners();
  }

}