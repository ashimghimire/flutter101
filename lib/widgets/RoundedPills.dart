import 'package:flutter/material.dart';

class RoundedPills extends StatelessWidget {
  final String text;
  final bool selected;


   const RoundedPills({ required this.text,  required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 90.0), child:Container(height: 30,  decoration: BoxDecoration(
        color:selected?Colors.black:Colors.white,
        border: Border.all(color:Colors.black26,width: 1.0) ,
        borderRadius: const BorderRadius.all(Radius.circular(45))),
        child: Padding( padding:const EdgeInsets.all(15), child:Center(child:Text(text, style: TextStyle(fontWeight:FontWeight.w400,
            color: selected?Colors.white:Colors.black),))),
    )));
  }
}
