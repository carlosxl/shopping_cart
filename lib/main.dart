import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/framework/widgets.dart';
import 'package:shopping_cart/screens/menu.dart';
import 'package:shopping_cart/screens/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CartBloc(),
      child: MaterialApp(
        title: 'Food Cart App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MenuScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
