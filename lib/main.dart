import 'package:flutter/material.dart';
import 'package:flutter_test_application/routes.dart';
import 'package:flutter_test_application/theme/app_theme.dart';

void main() => runApp(const PopayaApp());

class PopayaApp extends StatelessWidget {
  const PopayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESIDE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.routes,
    );
  }
}
