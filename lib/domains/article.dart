import 'package:flutter/src/material/dropdown.dart';

class Article {
  /**/
  final List <dynamic> article;


  Article(
      this.article
      );

factory Article.fromJson(List<dynamic> responseData) {
    return Article(
      responseData
    );
  }

}


class NewArticle {
  final name;
  final description;
  final is_rate;
  final check_stored;
  final created_at;
  final pu_ht;
  final pu_ht_custom;

  NewArticle (
      this.name,
      this.description,
      this.is_rate,
      this.check_stored,
      this.pu_ht,
      this.pu_ht_custom,
      this.created_at,

      );


  /*factory NewArticle.fromJson(Map<String, dynamic> jsonData) {
    return NewArticle(
      jsonData['name'],
      jsonData['description'],
      jsonData['is_rate'],
      jsonData['check_stored'],
      jsonData['pu_ht'],
      jsonData['pu_ht_custom'],
      jsonData['created_at'],

    );
  }*/
}
