import 'package:flutter/cupertino.dart';

class LocationData extends ChangeNotifier {
  String _location = '';

  String get location => _location;

  void setLocation(String location) {
    _location = location;
    notifyListeners();
  }
}