import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/shared_preferences.dart';

class ArtProvider extends ChangeNotifier {
  Future<Map<String, dynamic>> list() async {
    Response response = await get(
      AppUrl.articles + '?per_page=1000',
      headers: {'Content-Type': 'application/json', 'Authorization': UserPreferences().getapi_Key().toString()},
    );

    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      debugPrint(userData.toString());
      // Ici on
      //Article addArticle = Article.fromJson(userData['data']['data']);
    }
    return result;
  }
}
