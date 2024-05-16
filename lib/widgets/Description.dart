import 'package:flutter/material.dart';
import 'package:prioritysoft/models/ProductDetail.dart';

class Description extends StatelessWidget {
  final ProductDetail productDetail;

  const Description(this.productDetail, {super.key});

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
        "y ",
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
