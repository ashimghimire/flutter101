

class ProductList {
  late List<Product> _productlist;

  ProductList(this._productlist);

  List<Product> get brandlist => _productlist;

  set productlist(List<Product> value) {
    _productlist = value;
  }
  static List<Product> fromJson (List<dynamic> parsedJson){
    List<Product> products=[];
    for(var json in parsedJson){
      products.add(Product.fromJson(json));
    }
    return products;
  }
}

class Product {
  String _name;
  String _average_rating;
  String _brandId;
  String _color;
  String _gender;
  String _image;
  String _no_of_reviews;
  String _price;
  String _title;
  String _id;


  String get brandId => _brandId;

  set brandId(String value) {
    _brandId = value;
  }

  Product(
      this._name,
      this._average_rating,
      this._brandId,
      this._color,
      this._gender,
      this._image,
      this._no_of_reviews,
      this._price,
      this._title,
      this._id);

     String get name => _name; // Getters
     String get color => _color;
      String get gender => _gender;
      String  get image => _image;
      String   get no_of_reviews => _no_of_reviews;
      String   get id => _id;
      String get average_rating => _average_rating;

  set average_rating(String value) {
    _average_rating = value;
  }

  set id(String value) {
        _id = value;
      }
      set color(String value) {
        _color = value;
      }

      set gender(String value) {
        _gender = value;
      }

      set image(String value) {
        _image = value;
      }

      set no_of_reviews(String value) {
        _no_of_reviews = value;
      }

      set name(String value) {
        _name = value;
      } // Factory method to deserialize JSON

      set brand_id(String value) {
        _brandId = value;
      }

      String get price => _price;

      set price(String value) {
        _price = value;
      }

      String get title => _title;

      set title(String value) {
        _title = value;
      }


  Product.fromJson (Map<String, dynamic> parsedJson)
      :_id=parsedJson['_docId'],
        _name=parsedJson['name'],
        _average_rating=parsedJson['name'],
        _color=parsedJson['color'],
        _gender=parsedJson['gender'],
        _brandId=parsedJson['brand_id'],
        _price=parsedJson['price'],
        _title=parsedJson['title'],
        _image=parsedJson["image"],
        _no_of_reviews=parsedJson['no_of_reviews'];
}