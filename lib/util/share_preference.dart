import 'package:myflutter/domains/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("firstname", user.firstname);
    prefs.setString("lastname", user.lastname);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phone);
    prefs.setInt("curr_org_id", user.curr_org_id);
    prefs.setString("api_key", user.api_key);


    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
}