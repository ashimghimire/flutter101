import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class BrandList extends StatelessWidget {
  const BrandList({super.key});
  Widget circularDisplay( String url, String text ,String item, bool active){
    return  Badge(
        label:  Text("\u2713", style: TextStyle(fontSize: 10.0),),
        backgroundColor: active?Colors.black:Colors.transparent, alignment: Alignment.centerRight, textColor: Colors.white, child:Column( children: [
      Container(height:60,width:60,
      decoration:BoxDecoration(
          color:Colors.black12,
          border: Border.all(color:Colors.black12 ,width: 1.0),
          borderRadius: BorderRadius.circular(100.0)), padding: EdgeInsets.all(5.0),
         child:Center(child:Image.asset(url,fit: BoxFit.cover,scale: 01),
      ),),
       Center(child:Text(text)),
       Center(child:Text(item, style: TextStyle(fontWeight: FontWeight.w300,color:Colors.black12),),)
    ]));
  }

  List<Widget> brands(){
    List<Widget> list=[];
    list.add(circularDisplay('assets/images/brand/b1.png','Nike', '100 items', true));
    list.add(SizedBox(width: 24));
    list.add(circularDisplay('assets/images/brand/b2.png','Adidas', '100 items', false));
    list.add(SizedBox(width: 24));
    list.add(circularDisplay('assets/images/brand/b3.png','Puma', '100 items', false));
    list.add(SizedBox(width: 24));
    list.add(circularDisplay('assets/images/brand/b4.png','Reebok', '100 items', false));
    list.add(SizedBox(width: 24));
    list.add(circularDisplay('assets/images/brand/b3.png','Pentagon', '100 items', false));
  return list;
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(child:ListView(children: brands(),scrollDirection:Axis.horizontal,), height: 100);
  }
}
