import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    var appLightTheme = ThemeData(
        appBarTheme: const AppBarTheme(),
        cardColor: Colors.deepPurple[200],
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.deepPurple,
            onPrimary: Colors.white,
            onSurface: Colors.white));

    return appLightTheme.copyWith(
        textTheme: appLightTheme.textTheme
            .apply(displayColor: Colors.white, bodyColor: Colors.white));
  }
}
