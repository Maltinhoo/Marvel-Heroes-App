import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final BoxConstraints constraints;
  final String movie;
  const MovieCard({Key? key, required this.constraints, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.4,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(movie, fit: BoxFit.fill),
      ),
    );
  }
}
