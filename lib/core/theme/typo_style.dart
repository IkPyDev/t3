
import 'package:flutter/material.dart';

abstract class TypoStyle {
  // Define the font family globally
  static const String _fontFamily = 'SFProDisplay';

  // Styles extracted from the provided image
  static TextStyle get title1 => _textStyle(22, FontWeight.w600, 26); // Sembold
  static TextStyle get title2 => _textStyle(20, FontWeight.w600, 24); // Sembold
  static TextStyle get title3 => _textStyle(16, FontWeight.w600, 20); // Medium
  static TextStyle get title4 => _textStyle(14, FontWeight.w400, 18); // Regular

  static TextStyle get text1 => _textStyle(16, FontWeight.w400, 20); // Regular
  static TextStyle get text2 => _textStyle(14, FontWeight.w400, 17); // Sembold

  static TextStyle get buttonText1 => _textStyle(16, FontWeight.w400, 20); // Regular
  static TextStyle get tabText => _textStyle(10, FontWeight.w400, 11); // Regular

  // Helper method to create text styles
  static TextStyle _textStyle(
      double fontSize,
      FontWeight fontWeight,
      double lineHeight,
      ) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight / fontSize,
      letterSpacing: 0.0, // Adjust letter spacing as needed
      overflow: TextOverflow.ellipsis, // Default text overflow
    );
  }
}
