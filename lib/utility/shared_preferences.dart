import 'package:flutter/cupertino.dart';
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
    final prefs = await SharedPreferences.getInstance();

    final firstname = prefs.getString("firstname");
    final lastname = prefs.getString("lastname");
    final email = prefs.getString("email");
    final phone = prefs.getString("phone");
    final currOrgId = prefs.getString("curr_org_id");
    final apiKey = prefs.getString("api_key");

    return User(
        firstname: firstname,
        lastname: lastname,
        email: email,
        phone: phone,
        curr_org_id: currOrgId,
        api_key: apiKey);

  }

  void removeUser() async {
    final  prefs = await SharedPreferences.getInstance();

    prefs.remove("firstname");
    prefs.remove("lastname");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("curr_org_id");
    prefs.remove("api_key");
  }
  Future<String> getapi_Key(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("api_key");
  }
}