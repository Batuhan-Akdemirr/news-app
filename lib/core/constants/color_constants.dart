import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static ColorConstants? _instance;

  static ColorConstants get instance {
    if (_instance != null) return _instance!;
    _instance = ColorConstants._();
    return _instance!;
  }

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color black12 = Colors.black12;
  final Color red = Colors.red;
  final Color transparent = Colors.transparent;
  final Color blue = Colors.blue;
}
