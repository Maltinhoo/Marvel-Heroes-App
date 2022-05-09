import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text(text, key: Key('snackbar_text'))));
}
