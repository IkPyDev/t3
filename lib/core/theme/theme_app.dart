import 'package:flutter/material.dart';
import 'package:t3/core/theme/typo_style.dart';

abstract class ThemeApp {
  static const black = Color(0xFF0C0C0C);
  static const grey1 = Color(0xFF1D1E20);
  static const grey2 = Color(0xFF242529);
  static const grey3 = Color(0xFF3E3F43);
  static const grey4 = Color(0xFF3E3F43);
  static const grey5 = Color(0xFF5E5F61);
  static const grey6 = Color(0xFF9F9F9F);
  static const grey7 = Color(0xFFDBDBDB);
  static const grey8 = Color(0xFF2F3035);
  static const white = Color(0xFFFFFFFF);
  static const blue = Color(0xFF4C95FE);
  static const blueDark = Color(0xFF00427D);
  static const green = Color(0xFF4CB24E);
  static const greenDark = Color(0xFF015905);
  static const red = Color(0xFFFF0000);
  static const orange = Color(0xFFF36E36);
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeApp.blue,
    scaffoldBackgroundColor: ThemeApp.black,
    appBarTheme: const AppBarTheme(
      color: ThemeApp.white,
      iconTheme: IconThemeData(color: ThemeApp.black),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
    ),

    colorScheme: const ColorScheme(
      primary: ThemeApp.blue,
      primaryContainer: ThemeApp.blueDark,
      secondary: ThemeApp.green,
      secondaryContainer: ThemeApp.greenDark,
      surface: ThemeApp.grey1,
      // background: ThemeApp.grey2,
      error: ThemeApp.red,
      onPrimary: ThemeApp.white,
      onSecondary: ThemeApp.white,
      onSurface: ThemeApp.grey7,
      // onBackground: ThemeApp.grey7,
      onError: ThemeApp.white,
      brightness: Brightness.light,
      inversePrimary: ThemeApp.black,
    ),

    textTheme: TextTheme(
      headlineMedium: TypoStyle.title1.copyWith(color: ThemeApp.white),
      bodyMedium: TypoStyle.buttonText1.copyWith(color: ThemeApp.white),

    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ThemeApp.blue,
      textTheme: ButtonTextTheme.primary,
    ),

  );

  /*static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeApp.blueDark,
    scaffoldBackgroundColor: ThemeApp.black,
    appBarTheme: AppBarTheme(
      color: ThemeApp.grey1,
      iconTheme: IconThemeData(color: ThemeApp.white),
    ),
    colorScheme: const ColorScheme(
      primary: ThemeApp.blueDark,
      primaryContainer: ThemeApp.blue,
      secondary: ThemeApp.greenDark,
      secondaryContainer: ThemeApp.green,
      surface: ThemeApp.grey2,
      // background: ThemeApp.grey3,
      error: ThemeApp.red,
      onPrimary: ThemeApp.white,
      onSecondary: ThemeApp.white,
      onSurface: ThemeApp.grey6,
      // onBackground: ThemeApp.grey6,
      onError: ThemeApp.white,
      brightness: Brightness.dark,
    ),
    // textTheme: TextTheme(
    //   headline1: TextStyle(color: ThemeApp.white),
    //   bodyText1: TextStyle(color: ThemeApp.grey6),
    // ),
    buttonTheme: const ButtonThemeData(
      buttonColor: ThemeApp.blueDark,
      textTheme: ButtonTextTheme.primary,
    ),
  );*/
}

extension ThemeContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  dynamic get colorScheme => ThemeApp;
}
