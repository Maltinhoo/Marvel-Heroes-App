import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.amber.shade700,
  focusColor: Colors.orange,
  highlightColor: Colors.red,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Colors.amber,
  ),
  primaryIconTheme: IconThemeData(
    color: Colors.amber,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey.shade700),
);
