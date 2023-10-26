abstract class IApiService {
  getArticle(
      {required String languages, required int page, required int limit});
}
