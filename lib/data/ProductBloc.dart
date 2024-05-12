import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prioritysoft/TempSingleRepo.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prioritysoft/models/Product.dart';
import '../models/Brand.dart';
import 'package:prioritysoft/Logger.dart';

class ProductBloc extends Object {
  final _productsOutput = BehaviorSubject<Map<Brand, List<Product>>>();
  final productRepo = BehaviorSubject<Future<List<Product>>>();
  final homepageFavouredData=BehaviorSubject<Map<Brand, List<Product>>>();
  static final log=logger;
  static final TempSingleRepo singleRepo = TempSingleRepo();
  Stream<Map<Brand, List<Product>>> get items => _productsOutput.stream;
   late final Stream<QuerySnapshot<Map<String, dynamic>>>  productList;

  ProductBloc() {
    productList = singleRepo.getAllProducts();
    productList.transform(_streamTransformer).pipe(homepageFavouredData.sink);
  }

  Stream<Future<List<Product>>> get response => productRepo.stream;

  final StreamTransformer<QuerySnapshot<Map<String, dynamic>>, Map<Brand, List<Product>>> _streamTransformer =
  StreamTransformer.fromHandlers(
    handleData: (QuerySnapshot<Map<String, dynamic>> data, EventSink<Map<Brand, List<Product>>> sink) {
      log.d("Inside the loop");
      List<Product> list = ProductList.fromJson(data.docs);


    },
  );

  dispose() {
    productRepo.close();
    _productsOutput.close();
  }
}
