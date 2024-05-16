import 'package:prioritysoft/models/Product.dart';
import 'package:prioritysoft/models/ProductDetail.dart';

class ProductDetailReducer{
  late final Product _product;
  late final ProductDetail _productDetail;

  ProductDetailReducer( this._productDetail,this._product);

  ProductDetail get productDetail => _productDetail;

  set productDetail(ProductDetail value) {
    _productDetail = value;
  }

  Product get product => _product;

  set product(Product value) {
    _product = value;
  }
}