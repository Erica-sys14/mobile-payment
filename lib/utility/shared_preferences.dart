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
    prefs.setString("curr_org_id", user.curr_org_id);
    prefs.setString("api_key", user.api_key);


    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String firstname = prefs.getString("firstname");
    String lastname = prefs.getString("lastname");
    String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String currOrgId = prefs.getString("curr_org_id");
    String apiKey = prefs.getString("api_key");

    return User(
        firstname: firstname,
        lastname: lastname,
        email: email,
        phone: phone,
        curr_org_id: currOrgId,
        api_key: apiKey);

  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("firstname");
    prefs.remove("lastname");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("curr_org_id");
    prefs.remove("api_key");
  }
  Future<String> getapi_Key(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String api_key = prefs.getString("api_key");
    return api_key;
  }
}