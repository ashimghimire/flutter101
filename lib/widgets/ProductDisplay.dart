import 'package:flutter/material.dart';
class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding( padding: EdgeInsets.only(left: 0.0, right:0.0),child:Center(child:Container(

      clipBehavior: Clip.antiAlias,height: 300, width:double.infinity,child: Image.asset('assets/images/img_1.png'),

      decoration:BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(40.0)),)));
  }
}
