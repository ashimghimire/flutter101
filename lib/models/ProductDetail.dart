

class ProductDetail {

  String _brandId;
  String _description;
  var _colorVariations=[];
  var _size=[];
  var _genderVariations=[];
  var _images=[];
  String _productId;
  String _id;


  String get brandId => _brandId;

  set brandId(String value) {
    _brandId = value;
  }


  ProductDetail( this._brandId, this._colorVariations, this._size,
      this._genderVariations,this._description, this._images, this._productId, this._id);

      String get id => _id;

      set id(String value) {
        _id = value;
      }

      get genderVariations => _genderVariations;

      set genderVariations(value) {
        _genderVariations = value;
      }

      get size => _size;

      set size(value) {
        _size = value;
      }

      get colorVariations => _colorVariations;

      set colorVariations(value) {
        _colorVariations = value;
      }

      get description => _description;

      set description(value) {
        _description = value;
      }

      get images => _images;

      set images(value) {
        _images = value;
      }

      String get productId => _productId;

      set productId(String value) {
        _productId = value;
      }

  ProductDetail.fromJson (Map<String, dynamic> parsedJson)
      : _id=parsedJson['_docId'],
        _brandId=parsedJson['brand_id'],
        _genderVariations=parsedJson['gender_variations'],
        _colorVariations=parsedJson['color_variations'],
        _images=parsedJson['color_variations'],
        _size=parsedJson['size'],
        _description=parsedJson['description'],
        _productId=parsedJson["product_id"];


}