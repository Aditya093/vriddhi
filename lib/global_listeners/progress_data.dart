import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressData {
  int levelsCompleted;
  int tasksCompleted;
  String selectedCrop;

  ProgressData({this.levelsCompleted = 0, this.tasksCompleted = 0, this.selectedCrop = ''});
}

class ProgressProvider extends ChangeNotifier {
  ProgressData _progressData = ProgressData();

  ProgressData get progressData => _progressData;

  void updateProgressData(ProgressData newData) {
    _progressData = newData;
    notifyListeners();
    _saveProgressData(); // Save the updated progress data
  }

  Future<void> loadProgressData() async {
    final prefs = await SharedPreferences.getInstance();
    final levelsCompleted = prefs.getInt('levelsCompleted') ?? 0;
    final tasksCompleted = prefs.getInt('tasksCompleted') ?? 0;
    final selectedCrop = prefs.getString('selectedCrop') ?? '';

    _progressData = ProgressData(
      levelsCompleted: levelsCompleted,
      tasksCompleted: tasksCompleted,
      selectedCrop: selectedCrop,
    );
    notifyListeners();
  }

  Future<void> _saveProgressData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('levelsCompleted', _progressData.levelsCompleted);
    prefs.setInt('tasksCompleted', _progressData.tasksCompleted);
    prefs.setString('selectedCrop', _progressData.selectedCrop);
  }
}
