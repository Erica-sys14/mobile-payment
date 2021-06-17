class Article {
  String name;
  String description;
  int is_rate;
  int check_stored;
  String create_at;
  String update_at;



  Article(
      this.name,
      this.description,
      this.is_rate,
      this.check_stored,
      this.create_at,
      this.update_at
      );

  factory Article.fromJson(Map<String, dynamic> responseData) {
    return Article(
      responseData['name'],
      responseData['description'],
      responseData['is_rate'],
      responseData['check_stored'],
      responseData['create_at'],
      responseData['update_at'],
    );
  }


}