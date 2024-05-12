import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prioritysoft/Logger.dart';
import 'package:prioritysoft/data/ProductBloc.dart';


class ProductProvider extends InheritedWidget {
  final bloc = ProductBloc();
  static final log=logger;
  ProductProvider({required Key key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static ProductBloc? of(BuildContext context) {
    try {
      final productProvider = context.dependOnInheritedWidgetOfExactType<ProductProvider>();
      if (productProvider == null) {
        throw Exception('ProductProvider not found in the widget tree.');
      }
      log.d('Success in retrieving ProductBloc product');

      return productProvider.bloc;
    } catch (e, stackTrace) {
      // Log the error and stack trace for debugging purposes.
      log.d('Error in retrieving ProductBloc $e');
      log.d('Error in retrieving $stackTrace');
      return null;
    }
  }


}
