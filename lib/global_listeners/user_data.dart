import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String _username = '';
  String _email = '';


  String get username => _username;
  String get email => _email;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }
  void setUseremail(String email) {
    _email = email;
    notifyListeners();
  }
}
