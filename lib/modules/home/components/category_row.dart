import 'package:flutter/cupertino.dart';

import '../../../shared/components/category_circle.dart';

class CategoryRow extends StatelessWidget {
  final BoxConstraints constraints;
  const CategoryRow({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryCircle(
          image: 'hero.png',
          constraints: constraints,
          color1: Color(0xFF005BEA),
          color2: Color(0xFF00C6FB),
        ),
        CategoryCircle(
          image: 'villain.png',
          constraints: constraints,
          color1: Color(0xFFED1D24),
          color2: Color(0xFFED1F69),
        ),
        CategoryCircle(
          image: 'antihero.png',
          constraints: constraints,
          color1: Color(0xFFB224EF),
          color2: Color(0xFF7579FF),
        ),
        CategoryCircle(
          image: 'alien.png',
          constraints: constraints,
          color1: Color(0xFF0BA360),
          color2: Color(0xFF3CBA92),
        ),
        CategoryCircle(
          image: 'human.png',
          constraints: constraints,
          color1: Color(0xFFFF7EB3),
          color2: Color(0xFFFF758C),
        ),
      ],
    );
  }
}
