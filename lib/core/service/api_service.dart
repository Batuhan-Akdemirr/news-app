import 'package:dio/dio.dart';
import 'package:news_application/core/abstractions/api_service.dart';
import 'package:news_application/core/models/article_model.dart';

// 9f7865644edd447b8ed149de6ce28ce8
// 0c0747b56d704961896621bee2fc61e1
class ApiService implements IApiService {
  static const String APIKEY = "9f7865644edd447b8ed149de6ce28ce8";

  final Dio _dio = Dio();
//https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=0c0747b56d704961896621bee2fc61e1&page=0&pageSize=9
  @override
  Future<List<Article>> getArticle({required String languages}) async {
    final String endPointUrl =
        "http://newsapi.org/v2/top-headlines?country=$languages&category=business&apiKey=$APIKEY";

    try {
      Response res = await _dio.get(endPointUrl);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = res.data;

        List<dynamic> body = json['articles'];

        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        return articles;
      } else {
        throw ("Error");
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<List<Article>> getArticle2(
      {required String languages,
      required int page,
      required int limit}) async {
    final String endPointUrl =
        "http://newsapi.org/v2/top-headlines?country=$languages&category=business&apiKey=$APIKEY&page=$page&pageSize=$limit";
    print(endPointUrl);
    try {
      Response res = await _dio.get(endPointUrl);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = res.data;

        List<dynamic> body = json['articles'];

        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        return articles;
      } else {
        throw ("Error");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
