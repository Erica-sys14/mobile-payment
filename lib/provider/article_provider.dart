import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/utility/app_url.dart';
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
      var datas = json.decode(response.body)['data']['data'];
      return Article.fromJson(datas);
    }

    return result;
  }

  Future<List<NewArticle>> listDropdown() async {
    final prefs = await SharedPreferences.getInstance();
    Response response = await get(
      AppUrl.articles,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': prefs.getString("api_key")
      },
    );
    var result = json.decode(response.body)['data']['data'];
    print(response.body);

    List<NewArticle> dropdown = [];

    for(var u in result) {

      NewArticle mylist = NewArticle(u['name'],u['description'],u['is_rate'],u['check_stored'],u['pu_ht'],u['pu_ht_custom'],u['crated_at']);

      dropdown.add(mylist);
    }

    // if (response.statusCode == 200) {
    //   /*return json.decode(response.body)['data']['data'];*/
    //   result = json.decode(response.body)['data']['data'];
    //   var resultats ;
    //   for(var i = 0; i < result.length; i++){
    //       resultats.push((result[i] as List<NewArticle>).map((article) => article));
    //   }
    //   return resultats;
    // }
    //
    // return result;

      return dropdown;
    }






  Future<Map<String, dynamic>> create(name, description, isRate, checkStored,
      puHt, puHtCustom) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> saveData = {
      'name': name,
      'description': description,
      'is_rate': isRate,
      'check_store': checkStored,
      'pu_ht': puHt,
      'pu_ht_custom': puHtCustom,
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

  Future<Map<String, dynamic>>clear(articleId) async {
    final prefs = await SharedPreferences.getInstance();

    Response response = await delete(
      AppUrl.article_delete+articleId,
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

  Future<Map<String, dynamic>> MyList() async{
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
      final Map<String, dynamic> myArticles = json.decode(response.body)['data']['data'];
      return myArticles;
    }


    return result;
  }

}


