

import 'package:prioritysoft/Logger.dart';

class BrandList {
  late List<Brand> _brandlist;
  static final  log=logger;
  BrandList(this._brandlist);

  List<Brand> get brandlist => _brandlist;

  set brandlist(List<Brand> value) {
    _brandlist = value;
  }
  static List<Brand> fromJson (List<dynamic> parsedJson){
    List<Brand> brands=[];
    log.d('reacjed');
    for(var json in parsedJson){
      log.d(json.toString());
      brands.add(Brand.fromJson(json));
    }
    return brands;
  }
}


class Brand {
  String? _name;
  String? _logo;
  String? _id;

  Brand(this._name, this._logo, this._id);

  // Getters
  String? get name => _name;
  String? get logo => _logo;
  String? get id => _id;

  // Setters
  set name(String? name) {
    _name = name;
  }

  set path(String? logo) {
    _logo = logo;
  }


  // Factory method to deserialize JSON
   Brand.fromJson (Map<String, dynamic> parsedJson)
       :_id=parsedJson['_docId'],
         _name=parsedJson['name'],
         _logo=parsedJson['logo'];


}