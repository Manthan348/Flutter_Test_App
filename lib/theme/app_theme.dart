import 'package:flutter/material.dart';

class AppTheme {
  static const ink = Color(0xFF171717);
  static const muted = Color(0xFF929292);
  static const line = Color(0xFFE2E5E9);
  static const dark = Color(0xFF333333);
  static const canvas = Color(0xFFFCFCFC);
  static const yellow = Color(0xFFFFD34E);
  static const red = Color(0xFFFF1724);
  static const green = Color(0xFF4A842D);
  static const blue = Color(0xFF273DFF);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: canvas,
    colorScheme: ColorScheme.fromSeed(seedColor: ink, surface: Colors.white),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: ink,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: ink,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    dividerColor: line,
  );
}
