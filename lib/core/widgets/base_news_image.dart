import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/constants/radius_constants.dart';
import 'package:news_application/core/models/article_model.dart';

class BaseNewsImage extends StatelessWidget {
  BaseNewsImage({super.key, required this.article});
  final Article article;
  final double componentheight = 200.h;
  final String placeHolder = "assets/placeholder.jpeg";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: componentheight,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: article.urlToImage != null
              ? NetworkImage(article.urlToImage!)
              : AssetImage(placeHolder) as ImageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius:
            BorderRadius.circular(RadiusConstants.instance.normal),
      ),
    );
  }
}
