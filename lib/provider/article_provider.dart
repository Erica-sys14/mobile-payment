import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleProvider extends ChangeNotifier {
  Future<Article> list() async {
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


  Future<Map<String, dynamic>> create(name, description, is_rate, check_stored,
      pu_ht, pu_ht_custom) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> saveData = {
      'name': name,
      'description': description,
      'is_rate': is_rate,
      'check_store': check_stored,
      'pu_ht': pu_ht,
      'pu_ht_custom': pu_ht_custom,
    };


    Response response = await post(
      AppUrl.article_store,
      body: json.encode(saveData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': prefs.getString("api_key")
      },
    );


    var result;

    if (response.statusCode == 200) {
      return result = {
        'status': true,
      };
    }
    result = {
      'status': false,
    };
    return result;
  }

  Future<Map<String, dynamic>>clear(article_id) async {
    final prefs = await SharedPreferences.getInstance();

    Response response = await delete(
      AppUrl.article_delete+article_id,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': prefs.getString("api_key")
      },
    );

    var result;

    if (response.statusCode == 200) {
      return result = {
        'status': true,
      };
    }
    result = {
      'status': false,
    };
    return result;
  }

}


