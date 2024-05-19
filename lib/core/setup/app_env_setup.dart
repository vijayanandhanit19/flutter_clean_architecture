import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvSetup {
  factory AppEnvSetup() {
    return _singleton;
  }

  AppEnvSetup._();

  static final AppEnvSetup _singleton = AppEnvSetup._();

  String get apiDevUrl => dotenv.env['API_URL_DEV'] ?? '';
  String get apiKey => dotenv.env['API_KEY'] ?? '';

  String accessToken = '';

  Future<void> load() async {
    await dotenv.load(fileName: ".env");
  }
}
