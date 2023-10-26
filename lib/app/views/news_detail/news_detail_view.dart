import 'package:flutter/material.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/widgets/base_news_component.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class NewsDetailView extends StatelessWidget {
  NewsDetailView({super.key, required this.article});
  final Article article;
  final double componentheight = 200.h;
  final String placeHolder = "assets/placeholder.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.instance.black),
        backgroundColor: ColorConstants.instance.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          article.title ?? "",
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: ColorConstants.instance.black),
        ),
      ),
      body: Padding(
          padding: PaddingConstants.instance.generalHighHorizontalPadding +
              PaddingConstants.instance.generalHighVerticalPadding,
          child: Column(
            children: [
              BaseNewsComponent(article: article, isDetailView: true),
              Padding(
                  padding: PaddingConstants.instance.generalHighTopPadding * 2,
                  child: article.url != null ? Linkify(
                    onOpen: (link) async {
                      if (!await launchUrl(Uri.parse(link.url))) {
                        throw Exception('Could not launch ${link.url}');
                      }
                    },
                    text: article.url!,
                    linkStyle: TextStyle(color: ColorConstants.instance.blue),
                  ) : const SizedBox.shrink())
            ],
          )),
    );
  }
}
