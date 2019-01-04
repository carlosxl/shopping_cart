import 'package:flutter/material.dart';

import 'package:shopping_cart/models/menu_items.dart';
import 'package:shopping_cart/screens/menu.dart' show InheritedMenuScreen;

class MenuItemTile extends StatelessWidget {
  final MenuItem item;

  MenuItemTile({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.label),
      subtitle: Text(item.priceString),
      trailing: ButtonTheme.fromButtonThemeData(
        data: ButtonTheme.of(context).copyWith(
          minWidth: 24.0,
          height: 24.0,
          buttonColor: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        child: RaisedButton(
          child: Icon(Icons.add, size: 18),
          shape: CircleBorder(),
          onPressed: () {
            InheritedMenuScreen.of(context).bloc.addition.add(item);
          },
        ),
      ),
    );
  }
}
