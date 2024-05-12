import 'package:logger/logger.dart';

 final logger=Logger(printer: PrettyPrinter(
  methodCount: 1000,
  errorMethodCount: 1000,
  lineLength: 100
 ));