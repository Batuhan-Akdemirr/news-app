import 'package:flutter/material.dart';
import 'package:news_application/app/views/homepage/homepage_view.dart';
import 'package:news_application/core/data/abstractions/api_service.dart';
import 'package:news_application/product/enums/supported_countries.dart';
import 'package:news_application/core/models/article_model.dart';
import 'package:news_application/core/data/service/api_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class HomePageViewModel extends State<HomePage> {
  final IApiService apiService = ApiService();
  final String appTitle = "News App";
  SupportedCountries selectedCountry = SupportedCountries.us;
  final double flagIconSize = 28.h;
  final double countrySize = 24.w;
  int currentPage = 0;
  int limit = 10;
  List<Article> articles = [];
  bool isLoading = false;
  bool isNextPageLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    onCountryChanged();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
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

    final newArticles = await apiService.getArticle(
      languages: selectedCountry.name,
      page: currentPage + 1,
      limit: limit,
    );

    setState(() {
      articles.addAll(newArticles);
      currentPage++;
      isNextPageLoading = false;
      //debugPrint(currentPage.toString());
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
    setState(() {
      selectedCountry = newCountry;
      debugPrint(newCountry.toString());
    });

    onCountryChanged();
  }
}
