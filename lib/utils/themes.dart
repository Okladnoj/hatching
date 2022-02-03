import 'package:flutter/material.dart';

extension AppThemes on ThemeData {
  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.lightGreen,
      brightness: Brightness.light,
    );
  }

  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    );
  }
}
