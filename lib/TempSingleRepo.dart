import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Product.dart';


class TempSingleRepo {
    late final db;
  TempSingleRepo(){
    db=FirebaseFirestore.instance;
  }

  Future<List<Product>> getAllProducts() async {
   var event = await db.collection("products").get();
   return event.docs;
  }

    Future<List<Product>> getAllReviews() async {
      var event = await db.collection("reviews").get();
      return event.docs;
    }

    Future<List<Product>> getAllBrands() async {
      var event = await db.collection("brands").get();
      return event.docs;
    }

}

