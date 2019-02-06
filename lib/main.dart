import 'package:flutter/material.dart';

import 'package:shopping_cart/screens/menu.dart';
import 'package:shopping_cart/screens/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
