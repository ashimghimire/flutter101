import 'package:flutter/material.dart';
import 'package:prioritysoft/ShoeCard.dart';
import 'package:prioritysoft/screens/ProductDetailPage.dart';

class ShoesCard extends StatelessWidget {
  final ShoeCard shoeCard;

  const ShoesCard({required this.shoeCard});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/productDetail');

        }, child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20.0)) ,
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              child: Image.network(
                shoeCard.image,
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  shoeCard.name,
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
                    Text(shoeCard.averageRating, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(width: 10),
                    Text("(${shoeCard.numberOfReviews}) Reviews", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black12)),
                  ],
                ),
                Text(" ${shoeCard.price}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.0)),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
