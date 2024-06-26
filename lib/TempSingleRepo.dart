import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prioritysoft/models/Brand.dart' as b;
import 'package:prioritysoft/models/ProductDetail.dart';
import 'package:prioritysoft/models/ProductDetailReducer.dart';
import 'package:prioritysoft/widgets/BrandList.dart' ;
import 'package:prioritysoft/Logger.dart';
import 'package:rxdart/rxdart.dart';
import 'models/Brand.dart';
import 'models/Product.dart';



class TempSingleRepo {
    late final db;
    final log=logger;

  TempSingleRepo(){
    db=FirebaseFirestore.instance;
  }

    Stream<List<Product>> getAllProducts()  {
    Map<String,dynamic> dataProcessor={};
    var event = FirebaseFirestore.instance.collection("product").get().asStream().map((querysnapshot) => querysnapshot.docs.map((doc) {
      dataProcessor.addEntries(doc.data().entries);
      dataProcessor.putIfAbsent('id', () => doc.id);
      return Product.fromJson(dataProcessor);}).toList());
    return event;
  }

    Stream<ProductDetail?> getProductDetail(Product product) {
        log.d(product.id);
      return FirebaseFirestore.instance
        .collection("productDetail")
        .where("product_id", isEqualTo: product.id)
        .snapshots().map((snapshot){
          log.d("Snapshots");
          log.d(snapshot.docs.isNotEmpty);
          if(snapshot.docs.isNotEmpty) {
            final data=snapshot.docs.first.data();
            return ProductDetail.fromJson(data);
          }else {
            return null;
          }
    });
    }



    Future<List<Product>> getAllReviews() async {
      var event = await db.collection("reviews").get();
      return event.docs;
    }

    Stream<List<b.Brand>> getAllBrands()  {

      var event =  FirebaseFirestore.instance.collection('brands').get().asStream();
     return getListFromStream(event);

    }

    Stream<List<b.Brand>> getListFromStream(Stream<QuerySnapshot<Map<String, dynamic>>> stream){
        return stream.map((querysnapshot) => querysnapshot.docs.map((doc)=>b.Brand(doc['name'], doc['logo'], doc.id)).toList());
    }
}

