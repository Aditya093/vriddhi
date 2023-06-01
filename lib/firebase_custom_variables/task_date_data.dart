import 'package:flutter/material.dart';
class TaskDateData extends ChangeNotifier {
  String _startDate = '';
  String _endDate = '';

  String get startDate => _startDate;

  void setStartDate(String location) {
    _selectedCrop = location;
    notifyListeners();
  }
}