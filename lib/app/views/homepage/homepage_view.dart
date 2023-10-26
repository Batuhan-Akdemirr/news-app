import 'package:flutter/material.dart';
import 'package:news_application/app/views/homepage/homepage_viewmodel.dart';
import 'package:news_application/core/constants/color_constants.dart';
import 'package:news_application/core/constants/padding_constants.dart';
import 'package:news_application/product/enums/supported_countries.dart';
import 'package:news_application/product/extensions/supported_countries_extension.dart';
import 'package:news_application/product/extensions/supported_country_name_extension.dart';
import 'package:news_application/core/widgets/custom_news_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageViewModel {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appTitle,
          style: TextStyle(color: ColorConstants.instance.black),
        ),
        backgroundColor: ColorConstants.instance.transparent,
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
                      onCountrySelected(value);
                      debugPrint(value.toString());
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
      body: ListView.builder(
        controller: scrollController,
        itemCount: articles.length + 1,
        itemBuilder: (context, index) {
          if (index == articles.length) {
            return isNextPageLoading
                ? Container(
                    padding: PaddingConstants
                            .instance.generalHighHorizontalPadding +
                        PaddingConstants.instance.generalHighVerticalPadding,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation(ColorConstants.instance.blue),
                    ),
                  )
                : Container();
          }
          if (index == articles.length - 1) {
            Future.microtask(() {
              loadNextPage();
            });
          }
          return CustomNewsWidget(article: articles[index]);
        },
      ),
    );
  }
}
