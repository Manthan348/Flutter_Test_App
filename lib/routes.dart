import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/managerDashboard.dart';
import 'package:flutter_test_application/screens/teamPerformance.dart';
import 'package:flutter_test_application/screens/teamsTask.dart';

class AppRoutes {
  static const initial = '/';
  static const teamPerformance = '/teamPerformance';
  static const teamTasks = '/teamTasks';

  static final Map<String, WidgetBuilder> routes = {
    initial: (_) => const Managerdashboard(),
    teamPerformance: (_) => const Teamperformance(),
    teamTasks: (_) => const TeamsTaskScreen(),
  };
}
