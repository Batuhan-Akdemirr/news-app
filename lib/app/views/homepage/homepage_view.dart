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
  int currentPage = 0;
  int limit = 30;
  List<Article> articles = [];
  bool isLoading = false;
  bool isNextPageLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    onCountryChanged();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!isNextPageLoading) {
        loadNextPage();
      }
    }
  }

  Future<void> loadNextPage() async {
    if (isLoading || isNextPageLoading) {
      return;
    }
    setState(() {
      isNextPageLoading = true;
    });

    final newArticles = await apiService.getArticle2(
      languages: selectedCountry.name,
      page: currentPage + 1,
      limit: limit,
    );

    setState(() {
      articles.addAll(newArticles);
      currentPage++;
      isNextPageLoading = false;
    });
  }

  void onCountryChanged() {
    setState(() {
      articles.clear();
      currentPage = 0;
    });
    loadNextPage();
  }

  void onCountrySelected(SupportedCountries newCountry) {
    onCountryChanged();
    setState(() {
      selectedCountry = newCountry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        controller: _scrollController,
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
