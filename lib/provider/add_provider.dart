import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ArtProvider extends ChangeNotifier {
  Future <Map<String, dynamic>> list() async {
    final prefs = await SharedPreferences.getInstance();
    Response response = await get(
      AppUrl.articles,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': prefs.getString("api_key")
      },
    );


    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      //Article _article = Article.fromJson(userData['data']['data']);

      result = {
        'status': true,
        'message': 'Successful',
        'data': userData
      };
    }

    return result;
  }
}

/*
void
 */