import 'package:flutter/material.dart';
import 'package:news_application/core/abstractions/api_service.dart';
import 'package:news_application/core/enums/supported_languages.dart';
import 'package:news_application/core/service/api_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final IApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FloatingActionButton(
        onPressed: () {
          apiService.getArticle(SupportedLanguages.us.name);
        },
      ),
    );
  }
}
