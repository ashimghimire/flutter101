import 'package:flutter/material.dart';
import 'package:prioritysoft/screens/HomePage.dart';
import 'package:prioritysoft/screens/ProductDetailPage.dart';
import 'package:prioritysoft/screens/ProductFilter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ProductProvider.dart';
import 'firebase_options.dart';



import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProductProvider(
        key: GlobalKey(),
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: 'Urbanist',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes:{
        '/':(context) =>  HomePage(title: 'Discover', key: GlobalKey(debugLabel: 'homepage'),),
        '/productDetail':(context)=>ProductDetailPage(key:GlobalKey(debugLabel: 'productdetailpage') ,),
        '/productFilter' :(context)=>ProductFilter(key:GlobalKey(debugLabel: 'productFilter'))
      },

    ));
  }
}

