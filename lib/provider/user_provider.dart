import 'package:flutter/foundation.dart';
import 'package:myflutter/domains/user.dart';


class UserProvider with ChangeNotifier {
  var _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }



}