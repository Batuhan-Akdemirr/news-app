import 'package:flutter/material.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/core/constants/radius_constants.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNewsWidget extends StatelessWidget {
  const CustomNewsWidget({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Detaya git
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
        child: BaseNewsComponent(article: article),
      ),
    );
  }
}

class BaseNewsComponent extends StatelessWidget {
  BaseNewsComponent({
    super.key,
    required this.article,
  });
  final double componentheight = 200.h;
  final String placeHolder = "assets/placeholder.jpeg";
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: componentheight,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: article.urlToImage != null
                  ? NetworkImage(article.urlToImage!)
                  : AssetImage(placeHolder)
                      as ImageProvider, 
              fit: BoxFit.cover,
            ),
            borderRadius:
                BorderRadius.circular(RadiusConstants.instance.normal),
          ),
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
          child: Text(
            article.title ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
