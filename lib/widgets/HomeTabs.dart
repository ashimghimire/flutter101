
import 'dart:ffi';

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







  Widget HomeTabsView(BuildContext context) {
    final bloc = ProductProvider.of(context);

    return
      StreamBuilder(
        stream: bloc?.items,
        builder: (BuildContext context, AsyncSnapshot<Map<Brand, List<Product?>>> snapshot) {
          if (snapshot.hasData) {
            Map<Brand, List<Product?>>? data = snapshot.data;
            final brands = snapshot.data!.keys.toList();
            final gridView = brands.where((brand) => data![brand]!.isNotEmpty).map((brand) {
              List<Product?>? product = data?[brand];
              int size = 0; // Initialize size here
              if (product != null && product.isNotEmpty) {
                size = product.length;
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
                itemCount: size,
                itemBuilder: (BuildContext context, int index) {
                  // Ensure product is not null before accessing its elements
                  return product != null && product.isNotEmpty ? ShoesCard(shoeCard: product[index]) : SizedBox();
                },
              );
            }).toList(); // Convert the iterable to a list
            // Return the list of grid views here
            return TabBarView(
              children: gridView,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      );

  }
