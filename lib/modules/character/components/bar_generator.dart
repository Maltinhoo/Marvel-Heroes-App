import 'package:flutter/material.dart';

import '../../../shared/resources/styles.dart';

Widget barGenerator(String habilidade, int total) {
  double totalAdaptado = total * 0.4;
  String text1 = '';
  String text2 = '';
  for (var i = 0; i < 40; i++) {
    if (i < totalAdaptado) {
      text1 += 'I ';
    } else {
      text2 += 'I ';
    }
  }
  return Padding(
    padding: EdgeInsets.only(bottom: 16.0, left: 32.0, right: 32.0),
    child: Row(
      children: [
        Expanded(
          child: Text(
            habilidade,
            style: ability,
          ),
        ),
        Text(
          text1,
          style: TextStyle(
              fontFamily: 'GilroyRegular',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        Text(
          text2,
          style: TextStyle(
              fontFamily: 'GilroyRegular',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        )
      ],
    ),
  );
}
