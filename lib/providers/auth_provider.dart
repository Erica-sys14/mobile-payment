import 'dart:async';
import 'dart:convert';
import  'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/user.dart';
import 'package:myflutter/util/app_url.dart';
import 'package:myflutter/util/share_preference.dart';


enum Status {
  NotLoggedIn,
  LoggedIn,
  Authenticating,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  set loggedStatus(Status value) {
    _loggedInStatus = value;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'user': {
        'email': 'ngoeocke@gmail.com',
        'password': 'abcd1234'
      }
    };


    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post (
      AppUrl.login,
      body: json.encode(loginData),
      headers : {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      var userData = responseData['data']['user'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = { 'status': true, 'message':'Successful', 'user': authUser
      };
    }
      else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {
          'status' : false,
          'message' : json.decode(response.body)['error']
        };
    }
      return result;
  }
  static onError(error){
    print('the error is ${error.detail}');
    return {
      'status':false,
      'message':'Unsuccessful Request',
      'data':error
    };
  }
}