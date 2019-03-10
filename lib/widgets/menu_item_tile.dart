import 'package:flutter/material.dart';

import 'package:shopping_cart/framework/widgets.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/models/menu_items.dart';

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
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return BlocEventStateBuilder<CartEvent, CartState>(
      bloc: cartBloc,
      builder: (BuildContext context, CartState state) {
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
            cartBloc.emitEvent(CartEventAddition(item, 1));
          },
          color: Colors.white,
        );

        Widget addButton = RaisedButton(
          child: Icon(Icons.add, size: 18),
          shape: CircleBorder(),
          onPressed: () {
            cartBloc.emitEvent(CartEventAddition(item, 1));
          },
        );

        List<Widget> selector = [addButton];

        if (state.content.containsKey(item)) {
          selector = [
            removeButton,
            Text('${state.content[item]}',
                style: TextStyle(fontSize: 16.0)),
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
