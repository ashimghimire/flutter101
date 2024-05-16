import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prioritysoft/ProductProvider.dart';
import 'package:prioritysoft/models/Product.dart';
import 'package:prioritysoft/models/ProductDetail.dart';
import 'package:prioritysoft/models/ProductDetailReducer.dart';
import 'package:prioritysoft/widgets/Description.dart';
import 'package:prioritysoft/widgets/ProductDisplay.dart';
import 'package:prioritysoft/widgets/ReviewsList.dart';
import 'package:prioritysoft/widgets/SizeChooser.dart';

class ProductDetailPage extends StatelessWidget {
   ProductDetailPage({super.key});
  List<Widget> ratings(Product product){
    List<Widget> widgets=[];
    int limit=double.parse(product.average_rating).ceil();
    Iterable<int> numbers = Iterable.generate(limit, (index) => index);
    for(int a in  numbers){
      widgets.add(Icon(Icons.star_outlined, size: 18, color: Colors.yellow));
    }
    widgets.add(SizedBox(width: 10));
    widgets.add(Text(product.average_rating, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w700)));
    widgets.add(SizedBox(width: 10));
    widgets.add(Text(product.no_of_reviews, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black12)),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final bloc =ProductProvider.of(context);
    late  Product product;
    late ProductDetail productDetail;

    return MaterialApp(
      color: Colors.white,

      navigatorKey: GlobalKey<NavigatorState>(),
      home: Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: const [ Padding ( padding:EdgeInsets.only(right:14.0), child: Badge(backgroundColor: Colors.red, alignment: Alignment.topRight, smallSize: 10.0,
              child:ImageIcon(AssetImage('assets/images/img.png'), size: 24)))],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Row( children: [
           Expanded( flex:2,child: const Text('\$3500.39', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),)),

        Expanded(  flex:1,child:  SizedBox( width: 130,  child:FilledButton(onPressed: () {  },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              child:  Row( children:[const Expanded(child: Text("ADD TO CART", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w700, fontSize: 12.0

              ),))]))))
        ],),),
        body:  SingleChildScrollView( primary:true,
          padding:EdgeInsets.only(left: 24.0,right: 24.0) ,
          child: StreamBuilder<ProductDetailReducer>(stream: bloc?.productDetails,
    builder:(BuildContext context, AsyncSnapshot<ProductDetailReducer> snapshots) {
            if(!snapshots.hasData) return SizedBox(width: 100,height: 100,child: Text('No Data Available'),);
            ProductDetailReducer? productDetailReducer=snapshots.data;
            if(productDetailReducer!=null) {
                 product=productDetailReducer.product;
                 productDetail=productDetailReducer.productDetail;
            }
            return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             ProductDisplay(),
            SizedBox(height: 24),
            Padding(
                padding: EdgeInsets.only(left: 0.0,right: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      product.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 0),
                    Row(
                      children:ratings(product),
                    ),
                  ],
                ),

            ),
            SizedBox(height: 24),
            Text(
              "Size",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 12),
            SizeChooser(productDetail),
            SizedBox(height: 24),
            Description(productDetail),
            SizedBox(height: 24),
            ReviewList(),
            SizedBox(height: 24),
           Flexible(
               flex: 1,
               fit:FlexFit.loose,child: SizedBox(height: 40, width: double.infinity, child:  OutlinedButton(
                onPressed: (){},
               style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black26),),
                child: const  Text('SEE ALL REVIEWS', style: TextStyle(color: Colors.black54),))

           ) ),
            SizedBox(height: 24)]
        );}))));
  }
}
