class Url {
  static const GET_OFFICIAL_ACCOUNT_LIST =
      "https://wanandroid.com/wxarticle/chapters/json";

  static const GET_BANNER_LIST = "https://www.wanandroid.com/banner/json";

  ///使用时需要带上页码以及json后缀,完整的url: https://www.wanandroid.com/article/list/0/json
  static const GET_HOME_ARTICLES = "https://www.wanandroid.com/article/list/";

  static const JSON_SUFFIX = "/json";

  static const GET_USEFUL_WEBSITE = "https://www.wanandroid.com/friend/json";

  static const GET_PROJECT_CATEGORY =
      "https://www.wanandroid.com/project/tree/json";

  static const GET_EXACT_PROJECT_LIST =
      "https://www.wanandroid.com/project/list/";

  static String buildPageUrl(String url, int page) {
    return url + page.toString() + JSON_SUFFIX;
  }
}
