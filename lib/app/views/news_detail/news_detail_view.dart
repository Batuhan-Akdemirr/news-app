import 'package:flutter/material.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/widgets/base_news_component.dart';

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
          child: BaseNewsComponent(article: article, isDetailView: true)),
    );
  }
}
