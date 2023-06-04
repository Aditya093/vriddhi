import 'package:flutter/material.dart';

class WeatherDataAll extends ChangeNotifier {
  int _temperature = 0;
  int _wind = 0;
  int _humidity = 0;
  int _rain  = 0;
  String _condition = '';
  int _condition_id= 0;
  int get temperature => _temperature;
  int get humidity=>_humidity;
  int get wind =>_wind;
  int get rain =>_rain;
  String get condition => _condition;
  int get condition_id => _condition_id;
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
  void setCondition_Id(int id)
  {
    _condition_id=id;
    notifyListeners();
  }

}