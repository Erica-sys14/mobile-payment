import 'package:flutter/cupertino.dart';

class User {
  String first_name;
  String last_name;
  String email;
  int telephone;
  int curr_org_id;
  String api_key;

 int get get_curr_org_id {
    return this.curr_org_id;
  }
/*
  String get getlastname {
    return lastname;
  }

  String get getemail {
    return email;
  }

  String get getphone {
    return phone;
  }*/

  User(
    this.first_name,
    this.last_name,
    this.email,
    this.telephone,
    this.curr_org_id,
    this.api_key
  );

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      responseData['first_name'],
      responseData['last_name'],
      responseData['email'],
      responseData['telephone'],
      responseData['curr_org_id'],
      responseData['api_key'],
    );
  }

}