import 'package:ai_app/core/app_sizes/app_font_size.dart';
import 'package:flutter/material.dart';
import 'app_font_widget.dart';

class AppTextStyle {
  static TextStyle _getTextStyle(
      double fontSize, Color color, FontWeight fontWeight) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
  }

  /// static const FontWeight light = FontWeight.w300;
  static TextStyle getLightTextStyle(
      {double fontSize = AppFontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, color, AppFontWeight.light);
  }

  /// static const FontWeight regular = FontWeight.w400;
  static TextStyle getRegularTextStyle(
      {double fontSize = AppFontSize.s16, required Color color}) {
    return _getTextStyle(fontSize, color, AppFontWeight.regular);
  }

  /// static const FontWeight medium = FontWeight.w500;
  static TextStyle getMediumTextStyle(
      {double fontSize = AppFontSize.s20, required Color color}) {
    return _getTextStyle(fontSize, color, AppFontWeight.medium);
  }

  /// static const FontWeight semiBold = FontWeight.w600;
  static TextStyle getSemiBoldTextStyle(
      {double fontSize = AppFontSize.s24, required Color color}) {
    return _getTextStyle(fontSize, color, AppFontWeight.semiBold);
  }

  /// static const FontWeight bold = FontWeight.w700;
  static TextStyle getBoldTextStyle(
      {double fontSize = AppFontSize.s30, required Color color}) {
    return _getTextStyle(fontSize, color, AppFontWeight.bold);
  }
}
