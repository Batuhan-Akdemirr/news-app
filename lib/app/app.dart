import 'package:flutter/material.dart';
import 'package:news_application/app/views/homepage/homepage_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  final String appTitle = "News App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home:  HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
