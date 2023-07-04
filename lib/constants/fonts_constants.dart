import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///
/// ? Constants for Font sizes and Font Families
///
class DesignFonts {
  static double get s24 => 24.sp;
  static double get s26 => 26.sp;
  static double get s20 => 20.sp;
  static double get s18 => 18.sp;
  static double get s16 => 16.sp;
  static double get s14 => 14.sp;
  static double get s12 => 12.sp;
  static double get s10 => 10.sp;
  static double get s8 => 8.sp;

  ///
  /// ? Function for providing Font Family to the Text Widgets
  ///
  static TextStyle gilroy({
    required double fontSize,
    required FontWeight fontWeight,
    required Color fontColor,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: "Gilroy",
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        decoration: decoration,
      );
}
