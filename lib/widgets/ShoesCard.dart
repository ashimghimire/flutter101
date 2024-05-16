import 'package:flutter/material.dart';
import 'package:prioritysoft/ProductProvider.dart';
import 'package:prioritysoft/ShoeCard.dart';
import 'package:prioritysoft/screens/ProductDetailPage.dart';
import 'package:prioritysoft/Logger.dart';

import '../models/Product.dart';

class ShoesCard extends StatelessWidget {
  final Product? shoeCard;
  const ShoesCard({super.key, required this.shoeCard});

  @override
  Widget build(BuildContext context) {
    var log=logger;
  final bloc = ProductProvider.of(context);
    return GestureDetector(
        onTap: () {
          bloc?.addSelected(shoeCard!);
          Navigator.pushNamed(context, '/productDetail');
        }, child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20.0)) ,
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              child: Image.network(
                shoeCard!.image,
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 5.0,right: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  shoeCard!.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 0),
                Row(
                  children: [
                    Icon(Icons.star_outlined, size: 18, color: Colors.yellow),
                    SizedBox(width: 10),
                    Text(shoeCard!.average_rating, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(width: 10),
                    Text("(${shoeCard!.no_of_reviews}) Reviews", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black12)),
                  ],
                ),
                Text(" ${shoeCard!.price}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.0)),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
