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

  List<ShoeCard> generateMockApiResponse(){
    List<ShoeCard> list=[];
   var shoe=  ShoeCard(image: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6d297943-4dad-4cf7-a1c5-0a4786591ae1/air-max-dn-shoes-drXjb8.png', name:'Jordan 1 Retro High Tie Dye',price: '\$235,00',numberOfReviews: '1098',averageRating: '4.5');
   list.add(shoe);
    shoe=  ShoeCard(image: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a818a131-a5b1-43eb-ac0c-d68d33141819/dunk-low-next-nature-shoes-cFQPTp.png',name:'Jordan 1 Retro High Tie Dye',price: '\$235,00',numberOfReviews: '1092',averageRating: '3.6');
    list.add(shoe);
    return list;
  }
  @override
  Widget build(BuildContext context) {
    List<ShoeCard> shoeCard=generateMockApiResponse();
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
      body: Padding( padding:EdgeInsets.only(left:14.0, right: 14.0), child:HomeTabsView(shoeCard, context)),
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


