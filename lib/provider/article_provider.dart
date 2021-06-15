import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:myflutter/domains/article.dart';
import 'package:myflutter/utility/app_url.dart';
import 'package:myflutter/utility/shared_preferences.dart';

class ArticleProvider with ChangeNotifier {
  var _article;

  Article get article => _article;

  void setArticle(Article article) {
    _article = article;
    notifyListeners();
  }

}