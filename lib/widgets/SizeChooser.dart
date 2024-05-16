import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prioritysoft/ProductProvider.dart';
import 'package:prioritysoft/models/ProductDetail.dart';
import 'package:prioritysoft/Logger.dart';

class SizeChooser extends StatelessWidget {



  final ProductDetail productDetail;

  const SizeChooser(this.productDetail,{super.key});

  List<Widget> cDisplay(ProductDetail productDetail){
    var log=logger;
    List<Widget> wiZ=[];
     for(var i in productDetail.size){
       bool active=false;
       if(productDetail.size==41)  active= true;
       wiZ.add(circularDisplay(i as String, active));
       wiZ.add(const SizedBox(width: 16.0,));
     }
     return wiZ;
  }

  Widget circularDisplay( String text , bool active){
    return  Container(height:40,width:40,
        decoration:BoxDecoration(
            color:active?Colors.black:Colors.white ,
        border: Border.all(color:Colors.black12 ,width: 1.0),
        borderRadius: BorderRadius.circular(100.0) ), padding: EdgeInsets.all(5.0), child:Center(child:Text(text,
      style: TextStyle(color: active?Colors.white:Colors.black),
      )),);
  }

  @override
  Widget build(BuildContext context) {
    return   Padding( padding: const EdgeInsets.only(left: 0.0, right:0.0),child:Row(children: cDisplay(productDetail)));
  }
}