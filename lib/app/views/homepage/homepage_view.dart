import 'package:flutter/material.dart';
import 'package:news_application/core/abstractions/api_service.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:news_application/core/service/api_service.dart';
import 'package:news_application/core/widgets/custom_news_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final IApiService apiService = ApiService();
  final String appTitle = "News App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,
          style: TextStyle(color: ColorConstants.instance.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: apiService.getArticle("us"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    CustomNewsWidget(article: articles[index]));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
