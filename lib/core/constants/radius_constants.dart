import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadiusConstants {
  RadiusConstants._();
  static RadiusConstants? _instance;

  static RadiusConstants get instance {
    if (_instance != null) return _instance!;
    _instance = RadiusConstants._();
    return _instance!;
  }

  final double extraLow = 4.w;
  final double low = 8.w;
  final double normal = 12.w;
  final double large = 16.w;
  final double extraLarge = 20.w;
  final double extra2Large = 30.w;
}
