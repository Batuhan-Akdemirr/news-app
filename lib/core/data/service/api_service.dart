import 'package:dio/dio.dart';
import 'package:news_application/core/data/abstractions/api_service.dart';
import 'package:news_application/core/models/article_model.dart';

class ApiService implements IApiService {
  static const String APIKEY = "9f7865644edd447b8ed149de6ce28ce8";
  final Dio _dio = Dio();

  @override
  Future<List<Article>> getArticle(
      {required String languages,
      required int page,
      required int limit}) async {
       final String endPointUrl =
        "http://newsapi.org/v2/top-headlines?country=$languages&category=business&apiKey=$APIKEY&page=$page&pageSize=$limit";

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


// All APIKEY
// 9f7865644edd447b8ed149de6ce28ce8
// 0c0747b56d704961896621bee2fc61e1