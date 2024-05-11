import 'package:flutter/material.dart';
class SizeChooser extends StatelessWidget {
  const SizeChooser({super.key});

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
    return   Padding( padding: const EdgeInsets.only(left: 0.0, right:0.0),child:Row(children: [

      SizedBox(width: 0,),
      circularDisplay("39",false),
      SizedBox(width: 15,),
      circularDisplay("9.5", false),
      SizedBox(width: 15,),
      circularDisplay("40", false),
      SizedBox(width: 15,),
      circularDisplay("41", true),

    ],));
  }
}