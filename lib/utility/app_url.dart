class AppUrl {
  static const String liveBaseURL = "";
  static const String localBaseURL = "http://ms-billing-dev.nexah.net/api/v1/";

  static const String baseURL = localBaseURL;
  static const String login = baseURL + "mobile-login";
  static const String article_store = baseURL + "store-article";
  static const String article_delete = baseURL + "delete-article/";
  static const String articles = baseURL + "all-articles?per_page=100";

}