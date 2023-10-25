import 'package:flutter/material.dart';
import 'package:news_application/core/abstractions/api_service.dart';
import 'package:news_application/core/enums/supported_languages.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:news_application/core/models/source_model.dart';
import 'package:news_application/core/service/api_service.dart';
import 'package:news_application/core/widgets/custom_news_widget.dart';

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
      body: CustomNewsWidget(
          article: Article(
              source: Source(id: "abc-news", name: "ABC News"),
              author: "Amanda Maile, Emily Shapiro",
              content:
                  "The off-duty pilot accused of trying to crash an Alaska Airlines passenger plane allegedly tried to shut down the engines \"by engaging the Engine Fire Handle,\" according to the airline.\r\nThe fire sup… [+4286 chars]",
              description:
                  "Joseph David Emerson said he had not slept in 40 hours prior to the incident.",
              publishedAt: "2023-10-24T18:11:15Z",
              title:
                  "More details emerge after off-duty pilot allegedly tried to shut off engines on Alaska Airlines flight - ABC News",
              url:
                  "https://abcnews.go.com/US/details-emerge-after-off-duty-pilot-allegedly-shut/story?id=104247388",
                  urlToImage: "https://i.abcnewsfe.com/a/606634e1-3cb9-49a5-9e7f-72fbfdb763a1/Joe-Emerson-1-ht-gmh-231023_1698091765899_hpMain_16x9.jpg?w=992"
      )),
    );
  }
}
