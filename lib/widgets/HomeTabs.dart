
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:prioritysoft/ProductProvider.dart';
import 'package:prioritysoft/widgets/ShoesCard.dart';
import 'package:prioritysoft/models/Product.dart';
import 'package:prioritysoft/models/Brand.dart';
import '../Logger.dart';
import '../ShoeCard.dart';
import 'package:prioritysoft/Logger.dart';
final log=logger;

Widget HomeTabBar(BuildContext context) {

  final bloc = ProductProvider.of(context);
  bloc?.initialize();
  log.d("-===========-==-=---=-=");
  log.d(bloc?.items.first.toString());
  return StreamBuilder<Map<Brand, List<Product?>>>(
    stream: bloc?.items,
    builder: (BuildContext context, AsyncSnapshot<Map<Brand, List<Product?>>> snapshot) {

      if (snapshot.hasData) {
        log.d("324234");
        Map<Brand, List<Product?>>? data=snapshot.data;
        final brands = snapshot.data!.keys.toList();
        final tabs = brands.where((brand) => data![brand]!.isNotEmpty).map((brand) {
          return Tab(text: brand.name); // Assuming brands have a name property
        }).toList();
        return TabBar(
          dividerHeight: 0.0,
          labelColor: Colors.black,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.transparent,
                width: 0, // Thickness of the indicator line
              ),
            ),
          ),
          unselectedLabelColor: Colors.black26,
          labelStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 1.0),
          tabs: tabs,
        );
      } else if (snapshot.hasError) {

        return Text('Error: ${snapshot.error}'); // Or a more user-friendly message
      } else {

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
