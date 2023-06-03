import 'package:flutter/material.dart';
class FarmData extends ChangeNotifier {
  String _farmArea = '10';

  String get farmArea => _farmArea;

  void setFarmArea(String farmArea) {
    _farmArea = farmArea;
    notifyListeners();
  }
}