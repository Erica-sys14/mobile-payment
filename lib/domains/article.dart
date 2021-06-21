class Article {
  /*final String name;
  final String description;
  final int is_rate;
  final int check_stored;
  final String create_at;*/
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