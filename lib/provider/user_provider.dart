import 'package:flutter/foundation.dart';
import 'package:myflutter/domains/user.dart';


class UserProvider with ChangeNotifier {
  User _user = new User(curr_org_id: 'curr_org_id', lastname: 'lastname', firstname: 'firstname', api_key: 'api_key', phone: 'phone', email: 'email',);

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }



}