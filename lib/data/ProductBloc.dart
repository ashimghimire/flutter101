import 'dart:async';
import 'package:prioritysoft/TempSingleRepo.dart';
import 'package:prioritysoft/models/ProductDetail.dart';
import 'package:prioritysoft/models/ProductDetailReducer.dart';
import 'package:rxdart/rxdart.dart';
import 'package:prioritysoft/models/Product.dart';
import '../models/Brand.dart';
import 'package:prioritysoft/Logger.dart';

class ProductBloc extends Object {
  final productsOutput = BehaviorSubject<ProductDetailReducer>();
  final productRepo = BehaviorSubject<Future<List<Product>>>();
  final homepageFavouredData=BehaviorSubject<Map<Brand, List<Product>>>();
  static final log=logger;
  static final TempSingleRepo singleRepo = TempSingleRepo();
  Stream<Map<Brand, List<Product>>> get items => homepageFavouredData.stream;
  Stream<ProductDetailReducer> get productDetails => productsOutput.stream;
  static late  Stream<List<Product>>  productList;
  static late  Stream<List<Brand>> brandList;
  static late  Stream<ProductDetail> productDetailList;
  final  selectedProduct= PublishSubject<Product>();
  Function(Product) get addSelected => selectedProduct.sink.add;



  ProductBloc() {
    productList = singleRepo.getAllProducts();
    brandList = singleRepo.getAllBrands();
    transformStream(
        brandList, productList).pipe(homepageFavouredData.sink);
    log.d("reachedhedder");
    selectedProduct.listen((value) {log.d(value.no_of_reviews);});
    selectedProduct.transform(combineStream).pipe(productsOutput);

  }



  StreamTransformer<Product, ProductDetailReducer> combineStream =
  StreamTransformer.fromHandlers(handleData: (Product p, EventSink<ProductDetailReducer> sink)   {
    log.d("productDetail32232");

     singleRepo.getProductDetail(p).listen((event) {
       log.d("---------------");
       log.d(p.id);
       log.d(p.no_of_reviews);
       if(event!=null)
       sink.add(ProductDetailReducer(event!,p));
     });

    });

    // Set the controller's stream as the sink's stream
    

    // Close the controller when the sink is closed
    //sink.onCancel = () => controller.close();

   

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


  // dispose() {
  //   productRepo.close();
  //   productsOutput.close();
  //   homepageFavouredData.close();
  //  // selectedProduct.close();
  // }
}
