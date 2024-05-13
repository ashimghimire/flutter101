import 'dart:async';
import 'package:prioritysoft/TempSingleRepo.dart';
import 'package:prioritysoft/models/ProductDetailReducer.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prioritysoft/models/Product.dart';
import '../models/Brand.dart';
import 'package:prioritysoft/Logger.dart';

class ProductBloc extends Object {
  final productsOutput = BehaviorSubject<Stream<ProductDetailReducer>>();
  final productRepo = BehaviorSubject<Future<List<Product>>>();
  final homepageFavouredData=BehaviorSubject<Map<Brand, List<Product>>>();
  static final log=logger;
  static final TempSingleRepo singleRepo = TempSingleRepo();
  Stream<Map<Brand, List<Product>>> get items => homepageFavouredData.stream;
  Stream<Stream<ProductDetailReducer>> get productDetails => productsOutput.stream;
  static late  Stream<List<Product>>  productList;
  static late  Stream<List<Brand>> brandList;
  final  selectedProduct= PublishSubject<Product>();
  Function(Product) get addSelected => selectedProduct.sink.add;

   void initialize(){
      productList = singleRepo.getAllProducts();
      brandList = singleRepo.getAllBrands();
      transformStream(
          brandList, productList).pipe(homepageFavouredData.sink);


    }




  ProductBloc() {
    productList = singleRepo.getAllProducts();
    brandList = singleRepo.getAllBrands();
    selectedProduct.listen((value) {
      productsOutput.sink.add(singleRepo.getProductDetail(value));
    });
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
    productsOutput.close();
    homepageFavouredData.close();
    selectedProduct.close();
  }
}
