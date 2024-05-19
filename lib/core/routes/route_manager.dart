import 'package:flutter/material.dart';
import 'app_routes.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return AppRoutes.generateRoute(settings);
  }
}
