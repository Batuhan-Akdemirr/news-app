import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingConstants {
  PaddingConstants._();
  static PaddingConstants? _instance;

  static PaddingConstants get instance {
    if (_instance != null) return _instance!;
    _instance = PaddingConstants._();
    return _instance!;
  }

  final EdgeInsets generalExtraLowTopPadding = EdgeInsets.only(top: 4.h);
  final EdgeInsets generalExtraLowBottomPadding = EdgeInsets.only(bottom: 4.h);
  final EdgeInsets generalExtraLowRightPadding = EdgeInsets.only(right: 4.w);
  final EdgeInsets generalExtraLowLeftPadding = EdgeInsets.only(left: 4.w);
  final EdgeInsets generalExtraLowHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 4.w);
  final EdgeInsets generalExtraLowVerticalPadding =
      EdgeInsets.symmetric(vertical: 4.h);
  final EdgeInsets generalLowTopPadding = EdgeInsets.only(top: 8.h);
  final EdgeInsets generalLowBottomPadding = EdgeInsets.only(bottom: 8.h);
  final EdgeInsets generalLowRightPadding = EdgeInsets.only(right: 8.w);
  final EdgeInsets generalLowLeftPadding = EdgeInsets.only(left: 8.w);
  final EdgeInsets generalLowHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 8.w);
  final EdgeInsets generalLowVerticalPadding =
      EdgeInsets.symmetric(vertical: 8.h);

  final EdgeInsets generalMediumTopPadding = EdgeInsets.only(top: 12.h);
  final EdgeInsets generalMediumBottomPadding = EdgeInsets.only(bottom: 12.h);
  final EdgeInsets generalMediumLeftPadding = EdgeInsets.only(left: 12.w);
  final EdgeInsets generalMediumRightPadding = EdgeInsets.only(right: 12.w);
  final EdgeInsets generalMediumHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 12.w);
  final EdgeInsets generalMediumVerticalPadding =
      EdgeInsets.symmetric(vertical: 12.h);
  
  final EdgeInsets generalHighTopPadding = EdgeInsets.only(top: 16.h);
  final EdgeInsets generalHighBottomPadding = EdgeInsets.only(bottom: 16.h);
  final EdgeInsets generalHighLeftPadding = EdgeInsets.only(left: 16.w);
  final EdgeInsets generalHighRightPadding = EdgeInsets.only(right: 16.w);
  final EdgeInsets generalHighHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 16.w);
  final EdgeInsets generalHighVerticalPadding =
      EdgeInsets.symmetric(horizontal: 16.h);

  
  
}