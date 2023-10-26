import 'package:flutter/material.dart';
import 'package:news_application/app/views/homepage/homepage_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  final String appTitle = "News App";
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          title: appTitle,
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
