import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        "Description",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 16.0,
        ),
      ),
      SizedBox(height: 12,),
      Text(
        "Engineered to crush only movement-based wourout, these On sneakers enhance the labels orginal Cloud sneaker with cutting edge technologies",
        textAlign: TextAlign.left,
        style: TextStyle(
          height: 2,
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
        ),
      )
    ],);
  }
}
