import 'package:flutter/material.dart';
import 'package:prioritysoft/widgets/BrandList.dart';
import 'package:prioritysoft/widgets/FilterOptions.dart';
import 'package:prioritysoft/widgets/PriceRangePicker.dart';

class ProductFilter extends StatelessWidget {
  const ProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,

      navigatorKey: GlobalKey<NavigatorState>(),
      home: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height:70 ,
        surfaceTintColor: Colors.white,
        child: Row( children: [
           SizedBox( width: 150, height: 50,  child: OutlinedButton(onPressed: () {  },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
              child:Text("RESET", style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w700, fontSize: 14.0

              ),))),
          SizedBox(width: 40),
          SizedBox( width: 150, height: 50,  child:FilledButton(onPressed: () {  },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              child: Text("APPLY", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w700, fontSize: 14.0

              ),)))
        ],),),
          appBar: AppBar(
            title: Padding(padding:EdgeInsets.only(left:120.0),child:Text('Filter',style: TextStyle(fontWeight: FontWeight.w300),)),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),

          body:  SingleChildScrollView( primary:true,
            padding:EdgeInsets.only(left: 24.0,right: 0.0) ,
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 24),
                        const Text(
                          "Brands",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const  SizedBox(height: 10),
                        const  BrandList(),
                        const SizedBox(height: 24),
                        const Text(
                          "Price Range",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding( padding: EdgeInsets.all(0.0),
                       child:PriceRangePicker()),
                        const  SizedBox(height: 24),
                        const  Text(
                          "Sort By",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const  SizedBox(height: 10),
                        SizedBox(child:ListView(children: sortOptions(),scrollDirection:Axis.horizontal,), height: 50),
                        const SizedBox(height: 24),
                        const  Text(
                          "Gender",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const  SizedBox(height: 10),
                        SizedBox(child:ListView(children: genderOptions(),scrollDirection:Axis.horizontal), height: 50),
                        const  SizedBox(height: 24),
                        const Text(
                          "Color",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(child:ListView(children: colorOptions(),scrollDirection:Axis.horizontal), height: 50),
                        const  SizedBox(height: 24),
                      ]
            ),)
      ),
    );
  }
}
