import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:prioritysoft/ProductProvider.dart';
import 'package:prioritysoft/widgets/HomeTabs.dart';
import 'package:prioritysoft/Logger.dart';

import '../ShoeCard.dart';
import '../data/ProductBloc.dart';
import '../models/Brand.dart';
import '../models/Product.dart';

class HomePage extends StatelessWidget {
  final log=logger;
  final String? title;
   HomePage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
    child:Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Padding(padding:EdgeInsets.only(left:14.0, right:14.0),child:Text(title??'', style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 30, letterSpacing: 0.3))),
        actions: const [ Padding ( padding:EdgeInsets.only(right:14.0), child:Badge(backgroundColor: Colors.red, alignment: Alignment.center, smallSize: 10.0,
            child:ImageIcon(AssetImage('assets/images/img.png'), size: 24)))],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height as needed
          child: HomeTabBar(context), // Assuming HomeTabBar returns a PreferredSizeWidget
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding( padding:EdgeInsets.only(left:14.0, right: 14.0), child:HomeTabsView(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      SizedBox( width: 130, child:FloatingActionButton(onPressed: () {

        Navigator.pushNamed(context, '/productFilter');
      },
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          side: BorderSide(color: Colors.white)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.black,
      child: Row( children:[Expanded(flex:3, child: Image.asset('assets/images/img_1.png',scale: 1.5,)), Expanded( flex:4,child: Text("FILTER", style: TextStyle(color: Colors.white,
      fontWeight: FontWeight.w700, fontSize: 18.0

      ),))])))

    ));
  }
}


