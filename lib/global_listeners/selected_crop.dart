import 'package:flutter/material.dart';
class SelectedCrop extends ChangeNotifier {
  String _selectedCrop = '';

  String get selectedCrop => _selectedCrop;

  void setCurrentCrop(String crop) {
    _selectedCrop = crop;
    notifyListeners();
  }
}