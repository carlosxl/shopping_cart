import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder(
        stream: cartBloc.cart,
        builder: (BuildContext context, AsyncSnapshot<Cart> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<EntryCard> cards = [];
          for (CartEntry entry in snapshot.data.cartContent) {
            cards.add(EntryCard(entry));
          }
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
              StreamBuilder(
                stream: cartBloc.totalPrice,
                builder: (context, snapshot) {
                  final TextStyle style = TextStyle(
                      fontSize: 24.0,
                      color: Theme.of(context).primaryColorDark);
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return Text(
                    "Total: \$${snapshot.data}",
                    style: style,
                  );
                },
              ),
              StreamBuilder(
                stream: cartBloc.itemCount,
                builder: (context, snapshot) {
                  final TextStyle style = TextStyle(
                      fontSize: 24.0,
                      color: Theme.of(context).primaryColorDark);
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  String itemPluralized = snapshot.data == 1 ? 'item' : 'items';
                  return Text(
                    '${snapshot.data} $itemPluralized',
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
  final CartEntry entry;

  EntryCard(this.entry);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.check),
            title: Text(entry.item.label),
            subtitle: Text(entry.item.description),
            trailing: Text(entry.item.priceString),
          ),
        ],
      ),
    );
  }
}
