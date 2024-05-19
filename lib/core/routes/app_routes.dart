import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/chat/presentation/screen/chat_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
