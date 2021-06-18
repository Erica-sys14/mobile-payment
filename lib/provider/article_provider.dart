
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ArticleProvider extends ChangeNotifier {
  Future <Article> list() async {
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
      return Article.fromJson(json.decode(response.body)['data']['data']);
    }

    return result;
  }
}



