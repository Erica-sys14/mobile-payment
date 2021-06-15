import 'package:flutter/cupertino.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/domains/article.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {


  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("first_name", user.first_name);
    prefs.setString("last_name", user.last_name);
    prefs.setString("email", user.email);
    prefs.setInt("telephone", user.telephone);
    prefs.setInt("curr_org_id", user.curr_org_id);
    prefs.setString("api_key", user.api_key);


    return prefs.commit();
  }

  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    return User(
        prefs.getString("first_name"),
        prefs.getString("last_name"),
        prefs.getString("email"),
        prefs.getInt("telephone"),
        prefs.getInt("curr_org_id"),
        prefs.getString("api_key")
    );

  }

  void removeUser() async {
    final  prefs = await SharedPreferences.getInstance();

    prefs.remove("first_name");
    prefs.remove("last_name");
    prefs.remove("email");
    prefs.remove("telephone");
    prefs.remove("curr_org_id");
    prefs.remove("api_key");
  }
  Future<String> getapi_Key() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("api_key");
  }
}


