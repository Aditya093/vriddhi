import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String _username = '';
  String _email = '';
  String _photoUrl = '';

  String get username => _username;
  String get email => _email;
  String get photoUrl => _photoUrl;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }
  void setUseremail(String email) {
    _email = email;
    notifyListeners();
  }
  void setPhotoUrl(String url) {
    _photoUrl = url;
    notifyListeners();
  }
}
