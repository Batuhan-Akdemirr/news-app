import 'package:flutter/material.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/core/constants/radius_constants.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/widgets/base_news_image.dart';

class BaseNewsComponent extends StatelessWidget {
  BaseNewsComponent({
    super.key,
    required this.article,
    required this.isDetailView,
  });
  final double componentheight = 200.h;
  final String placeHolder = "assets/placeholder.jpeg";
  final Article article;
  final bool isDetailView;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseNewsImage(
          article: article,
        ),
        Padding(
          padding: PaddingConstants.instance.generalLowTopPadding,
          child: Container(
            padding: PaddingConstants.instance.generalLowVerticalPadding +
                PaddingConstants.instance.generalLowHorizontalPadding,
            decoration: BoxDecoration(
              color: ColorConstants.instance.red,
              borderRadius:
                  BorderRadius.circular(RadiusConstants.instance.extra2Large),
            ),
            child: Text(
              article.source.name ?? "",
              style: TextStyle(
                color: ColorConstants.instance.white,
              ),
            ),
          ),
        ),
        Padding(
            padding: PaddingConstants.instance.generalLowTopPadding,
            child: isDetailView
                ? Text(
                    article.description ?? "",
                    style: _titleDescriptionStyle(),
                  )
                : Text(
                    article.title ?? "",
                    style: _titleDescriptionStyle(),
                  ))
      ],
    );
  }

  TextStyle _titleDescriptionStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );
  }
}
