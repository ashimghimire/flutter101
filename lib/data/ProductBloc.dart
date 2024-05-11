// import 'dart:async';
// import 'package:prioritysoft/TempSingleRepo.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:flutter/material.dart';
// import 'package:prioritysoft/models/Product.dart';
//
// class ProductBloc extends Object {
//
//   final _products = BehaviorSubject<Future<List<Product?>>>();
//   final productRepo=PublishSubject<Future<List<Product?>>>();
//
//   Stream<Future<List<Product?>>> get response => productRepo.stream;
//
//   void login() async {
//     // Create a new LoginRepository instance
//     TempSingleRepo singleRepo = TempSingleRepo();
//
//     // Perform login operation
//     var loginResult = await singleRepo.getAllProducts();
//     response.sink.add(loginResult);
//   // }
//
//   StreamTransformer<Future<User?>,User?> _streamTransformer=StreamTransformer.fromHandlers(
//       handleData:(Future<User?> value, EventSink<User?> sink){
//
//         value.then((value) => sink.add(value));
//       },
//       handleError:(Object error,StackTrace e,EventSink<dynamic> sink){
//         sink.add(error);
//       }
//   );
//
//   dispose() {
//     loginResponse.close();
//     _login.close();
//   }
// }
