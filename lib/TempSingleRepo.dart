import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prioritysoft/models/Brand.dart' as b;
import 'package:prioritysoft/widgets/BrandList.dart' ;
import 'package:prioritysoft/Logger.dart';
import 'models/Product.dart';


class TempSingleRepo {
    late final db;
    final log=logger;

  TempSingleRepo(){
    db=FirebaseFirestore.instance;
  }

    Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts()  {
    var event = FirebaseFirestore.instance.collection("product").get().asStream();
    return event;
  }

    Future<List<Product>> getAllReviews() async {
      var event = await db.collection("reviews").get();
      return event.docs;
    }

    Stream<QuerySnapshot<Map<String, dynamic>>> getAllBrands()  {
      var event =  FirebaseFirestore.instance.collection('brands').get().asStream();
      // event.transform(streamTransformer).pipe();
      return event;
    }

}

