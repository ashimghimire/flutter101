import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prioritysoft/TempSingleRepo.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prioritysoft/models/Product.dart';
import 'package:rxdart/transformers.dart';
import '../models/Brand.dart';
import 'package:prioritysoft/Logger.dart';

class ProductBloc extends Object {
  final _productsOutput = BehaviorSubject<Map<Brand, List<Product>>>();
  final productRepo = BehaviorSubject<Future<List<Product>>>();
  final homepageFavouredData=BehaviorSubject<Map<Brand, List<Product>>>();
  static final log=logger;
  static final TempSingleRepo singleRepo = TempSingleRepo();
  Stream<Map<Brand, List<Product>>> get items => homepageFavouredData.stream;
  static late  Stream<List<Product>>  productList;
  static late  Stream<List<Brand>> brandList;

   void initialize(){
      productList = singleRepo.getAllProducts();
      brandList = singleRepo.getAllBrands();
      transformStream(
          brandList, productList).pipe(homepageFavouredData.sink);
    }



  ProductBloc() {
    log.d("----inside constructor");
    productList = singleRepo.getAllProducts();
    brandList = singleRepo.getAllBrands();


  }

  Stream<Map<Brand, List<Product>>> transformStream(Stream<List<Brand>> brandStream, Stream<List<Product>> productStream) {
    return brandStream.asyncMap((List<Brand> brands) async {
      Map<Brand, List<Product>> brandProductMap = {};
      await for (var products in productStream) {
        for (var brand in brands) {
          brandProductMap[brand] = products.where((product) => product.brandId == brand.id).toList();
        }

      }
      return brandProductMap;
    });
  }


  dispose() {
    productRepo.close();
    _productsOutput.close();
  }
}
