

class ReviewList {
  late List<Review> _reviewlist;

  ReviewList(this._reviewlist);

  List<Review> get reviewlist => _reviewlist;

  set reviewlist(List<Review> value) {
    _reviewlist = value;
  }
  static List<Review> fromJson (List<dynamic> parsedJson){
    List<Review> reviews=[];
    for(var json in parsedJson){
      reviews.add(Review.fromJson(json));
    }
    return reviews;
  }
}
class Review {
  String _name;
  String _image;
  String _id;
  String _description;
  String _productId;
  String _ratings;

  Review(this._name, this._image, this._id, this._description, this._productId,
      this._ratings);

  String get ratings => _ratings;

  set ratings(String value) {
    _ratings = value;
  }

  String get productId => _productId;

  set productId(String value) {
    _productId = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  // Factory method to deserialize JSON
  Review.fromJson (Map<String, dynamic> parsedJson)
      :_id=parsedJson['id'],
        _name=parsedJson['name'],
        _image=parsedJson['image'],
        _description=parsedJson['description'],
        _productId=parsedJson['productId'],
        _ratings=parsedJson['ratings'];


}