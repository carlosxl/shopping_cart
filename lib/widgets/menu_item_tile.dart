import 'package:flutter/material.dart';

import 'package:shopping_cart/models/cart.dart';
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
        child: buildAmountSelector(context),
      ),
    );
  }

  Widget buildAmountSelector(BuildContext context) {
    return StreamBuilder(
      stream: InheritedMenuScreen.of(context).bloc.cart,
      builder: (BuildContext context, AsyncSnapshot<Cart> snapshot) {
        Widget removeButton = RaisedButton(
          child: Icon(
            Icons.remove,
            size: 18,
            color: Theme.of(context).primaryColor,
          ),
          shape: CircleBorder(
              side: BorderSide(
                  color: Theme.of(context).primaryColor, width: 1.0)),
          onPressed: () {
            InheritedMenuScreen.of(context).bloc.removal.add(item);
          },
          color: Colors.white,
        );

        Widget addButton = RaisedButton(
          child: Icon(Icons.add, size: 18),
          shape: CircleBorder(),
          onPressed: () {
            InheritedMenuScreen.of(context).bloc.addition.add(item);
          },
        );

        List<Widget> selector = [addButton];

        if (snapshot.hasData && snapshot.data.getEntry(item) != null) {
          selector = [
            removeButton,
            Text('${snapshot.data.getEntry(item).count}', style: TextStyle(fontSize: 16.0)),
            addButton
          ];
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: selector,
        );
      },
    );
  }
}
