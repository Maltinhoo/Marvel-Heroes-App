enum PreferencesKey {
  token,
}

extension ParseToString on PreferencesKey {
  String toValue() => toString().split('.').last;
}
