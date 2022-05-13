import 'package:flutter/material.dart';

class CommonRow extends StatelessWidget {
  final String title;
  const CommonRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              color: Colors.red,
              fontFamily: 'GilroyBold',
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Ver tudo',
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'GilroyMedium',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
