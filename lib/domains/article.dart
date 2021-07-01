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


/*
class Create_article {
  String name;
  3
  String description;
  int is_rate;
  int check_stored;
  String create_at;
  int pu_ht;
  int pu_ht_custom;

  Create_article (
      this.name,
      this.description,
      this.is_rate,
      this.check_stored,
      this.create_at,
      this.pu_ht,
      this.pu_ht_custom,

      );

  factory Create_article.fromJson(Map<String, dynamic> jsonData) {
    return Create_article(
      jsonData['name'],
      jsonData['description'],
      jsonData['is_rate'],
      jsonData['check_stored'],
      jsonData['create_at'],
      jsonData['pu_ht'],
      jsonData['pu_ht_custom'],

    );
  }
}*/
