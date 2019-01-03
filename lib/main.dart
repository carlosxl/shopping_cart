import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/menu_bloc.dart';
import 'package:shopping_cart/screens/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchMenuItems();
    return MaterialApp(
      title: 'Food Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}