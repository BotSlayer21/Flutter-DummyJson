import 'package:flutter/material.dart';
import 'package:tugasku_8040210115/home_page.dart';
import 'package:tugasku_8040210115/product_detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/product-detail' : (context) => ProductDetail(),
      },
    );
  }
}
