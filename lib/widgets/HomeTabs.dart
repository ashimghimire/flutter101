import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prioritysoft/widgets/ShoesCard.dart';

import '../ShoeCard.dart';

  PreferredSizeWidget HomeTabBar() {
    return const  TabBar(
      dividerHeight: 0.0,
      labelColor: Colors.black,
      overlayColor:MaterialStatePropertyAll(Colors.transparent) ,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 0, // Thickness of the indicator line
          ),
        ),
      ),
      unselectedLabelColor: Colors.black26,
      labelStyle: TextStyle(fontSize:16.0,fontWeight: FontWeight.w700,letterSpacing:1.0),
      tabs: [Tab(text: 'Nike'),Tab(text: 'Addidas',)],);
  }




  Widget HomeTabsView(List<ShoeCard> shoecards, BuildContext context) {
    return
        TabBarView(
      children: <Widget>[GridView.builder(gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index){
           return  ShoesCard(shoeCard:shoecards[index]);
          },itemCount: shoecards.length,),
        GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,childAspectRatio: 0.8),
            itemBuilder: (BuildContext context, int index){
                return  ShoesCard(shoeCard:shoecards[index]);
              // return Text('popper');
            }, itemCount:shoecards.length)

        ], );
  }
