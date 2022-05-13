import 'package:flutter/material.dart';

class CategoryCircle extends StatelessWidget {
  final BoxConstraints constraints;
  final String image;
  final Color color1;
  final Color color2;
  const CategoryCircle(
      {Key? key,
      required this.image,
      required this.constraints,
      required this.color1,
      required this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(constraints.maxWidth * 0.03),
      height: constraints.maxHeight * .08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Image.asset(
        'assets/icons/$image',
        fit: BoxFit.cover,
        color: Colors.white,
      ),
    );
  }
}
