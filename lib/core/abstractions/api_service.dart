abstract class IApiService {
  getArticle({required String languages});
    getArticle2(
      {required String languages, required int page, required int limit});
}
