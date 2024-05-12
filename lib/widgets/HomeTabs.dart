
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:prioritysoft/ProductProvider.dart';
import 'package:prioritysoft/widgets/ShoesCard.dart';
import 'package:prioritysoft/models/Product.dart';
import 'package:prioritysoft/models/Brand.dart';
import '../Logger.dart';
import '../ShoeCard.dart';

PreferredSizeWidget? HomeTabBar(BuildContext context) {
  final bloc = ProductProvider.of(context);
   final log=logger;
   StreamBuilder<Map<Brand, List<Product?>>>(
    stream: bloc?.homepageFavouredData,
    builder: (BuildContext context, AsyncSnapshot<Map<Brand, List<Product?>>> snapshot) {
      if (snapshot.hasData) {
        log.d("324234");
        log.d(snapshot.data.toString());
        final brands = snapshot.data!.keys.toList();
        final tabs = brands.map((brand) => Tab(text: brand.name)).toList(); // Assuming brands have a name property
        return  TabBar(
          dividerHeight: 0.0,
          labelColor: Colors.black,
          overlayColor:MaterialStatePropertyAll(Colors.transparent) ,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.transparent,
                width: 0, // Thickness of the indicator line
              ),
            ),
          ),
          unselectedLabelColor: Colors.black26,
          labelStyle: const TextStyle(fontSize:16.0,fontWeight: FontWeight.w700,letterSpacing:1.0),
          tabs: tabs);
      } else if (snapshot.hasError) {
        log.d(snapshot.error.toString());
        return Text('Error: ${snapshot.error}'); // Or a more user-friendly message
      } else {
        log.d('Loading!!!');
        return const CircularProgressIndicator();
      }
    },
  );


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
