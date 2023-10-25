import 'package:flutter/material.dart';
import 'package:news_application/app/views/news_detail/news_detail_view.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/core/constants/radius_constants.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/widgets/base_news_component.dart';

class CustomNewsWidget extends StatelessWidget {
  const CustomNewsWidget({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToNewsDetail(context);
      },
      child: Container(
        margin: PaddingConstants.instance.generalMediumHorizontalPadding +
            PaddingConstants.instance.generalMediumVerticalPadding,
        padding: PaddingConstants.instance.generalLowHorizontalPadding +
            PaddingConstants.instance.generalLowVerticalPadding,
        decoration: BoxDecoration(
            color: ColorConstants.instance.white,
            borderRadius:
                BorderRadius.circular(RadiusConstants.instance.normal),
            boxShadow: [
              BoxShadow(
                color: ColorConstants.instance.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: BaseNewsComponent(article: article, isDetailView: false),
      ),
    );
  }

  void navigateToNewsDetail(BuildContext context) {
        Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return NewsDetailView(
          article: article,
        );
      },
    ));
  }
}

