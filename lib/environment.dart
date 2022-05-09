import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String getEnv(String name) => dotenv.env[name] ?? '';

  static String get api => getEnv('API');
}
