import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/framework/widgets.dart';
import 'package:shopping_cart/models/menu_items.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocEventStateBuilder<CartEvent, CartState>(
        bloc: cartBloc,
        builder: (BuildContext context, CartState state) {
          List<EntryCard> cards = [];
          state.content
              .forEach((item, count) => cards.add(EntryCard(item, count)));
          return Column(
            children: cards,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BlocEventStateBuilder<CartEvent, CartState>(
                bloc: cartBloc,
                builder: (context, state) {
                  final TextStyle style = TextStyle(
                      fontSize: 24.0,
                      color: Theme.of(context).primaryColorDark);
                  return Text(
                    "Total: \$${state.totalPrice}",
                    style: style,
                  );
                },
              ),
              BlocEventStateBuilder<CartEvent, CartState>(
                bloc: cartBloc,
                builder: (context, state) {
                  final TextStyle style = TextStyle(
                      fontSize: 24.0,
                      color: Theme.of(context).primaryColorDark);
                  String itemPluralized =
                      state.totalItems == 1 ? 'item' : 'items';
                  return Text(
                    '${state.totalItems} $itemPluralized',
                    style: style,
                  );
                },
              ),
            ],
          ),
        ),
        color: Theme.of(context).dialogBackgroundColor,
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class EntryCard extends StatelessWidget {
  final MenuItem item;
  final int count;

  EntryCard(this.item, this.count);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BlocEventStateBuilder(
            bloc: BlocProvider.of<CartBloc>(context),
            builder: (BuildContext context, CartState state) {
              return ListTile(
                leading: Icon(Icons.check),
                title: new CartLabel(item: item, count: state.content[item]),
                subtitle: Text(item.description),
                trailing: Text(item.priceString),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CartLabel extends StatelessWidget {
  const CartLabel({
    Key key,
    @required this.item,
    @required this.count,
  }) : super(key: key);

  final MenuItem item;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('${item.label} x $count');
  }
}
