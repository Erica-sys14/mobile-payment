import 'package:flutter/foundation.dart';
import 'package:myflutter/domains/user.dart';


class UserProvider with ChangeNotifier {
  User _user = new User(firstname: 'firstname', lastname: 'lastname', email: 'email', phone: 'phone', api_key: 'api_key', curr_org_id:'curr_org_id' );

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }



}