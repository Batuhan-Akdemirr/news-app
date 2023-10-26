import 'package:flutter/material.dart';
import 'package:news_application/core/abstractions/api_service.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/core/enums/SupportedCountries.dart';
import 'package:news_application/core/extensions/SupportedCountriesExtension.dart';
import 'package:news_application/core/extensions/SupportedCountryNameExtension.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:news_application/core/service/api_service.dart';
import 'package:news_application/core/widgets/custom_news_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IApiService apiService = ApiService();

  final String appTitle = "News App";
  SupportedCountries selectedCountry = SupportedCountries.us;
  final double flagIconSize = 28.h;
  final double countrySize = 24.w;

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
        actions: [
          Padding(
              padding: PaddingConstants.instance.generalHighHorizontalPadding,
              child: IconButton(
                onPressed: () {
                  final RenderBox overlay =
                      context.findRenderObject() as RenderBox;
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      overlay.size.width - 50.w,
                      kToolbarHeight + 10.h,
                      overlay.size.width,
                      overlay.size.height,
                    ),
                    items: SupportedCountries.values.map((country) {
                      return PopupMenuItem<SupportedCountries>(
                        value: country,
                        child: Row(
                          children: [
                            Image.asset(
                              country.assetName,
                              width: countrySize,
                              height: countrySize,
                            ),
                            Padding(
                              padding: PaddingConstants
                                  .instance.generalLowLeftPadding,
                              child: Text(country.countryName),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        selectedCountry = value;
                      });
                    }
                  });
                },
                icon: Image.asset(
                  selectedCountry.assetName,
                  width: flagIconSize,
                  height: flagIconSize,
                ),
              ))
        ],
      ),
      body: FutureBuilder(
        future: apiService.getArticle(selectedCountry.name),
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
