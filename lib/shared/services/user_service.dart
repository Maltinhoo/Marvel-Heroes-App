import 'package:shared_preferences/shared_preferences.dart';

import '../../models/preferences_key.dart';

class UserService {
  final SharedPreferences preferences;

  UserService({
    required this.preferences,
  });

  Future<bool> isLogged() async {
    final token = preferences.getString(PreferencesKey.token.toValue());
    return token != null;
  }

  Future<void> saveToken(String token) async {
    await preferences.setString(PreferencesKey.token.toValue(), token);
  }

  Future<void> logout() async {
    await preferences.remove(PreferencesKey.token.toValue());
  }
}
