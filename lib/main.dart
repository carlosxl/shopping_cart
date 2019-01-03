import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/menu_bloc.dart';
import 'package:shopping_cart/models/menu_items.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: StreamBuilder(
          stream: bloc.menuItems,
          builder: (BuildContext context, AsyncSnapshot<MenuItems> snapshot) {
            return buildList(snapshot);
          },
        ),
      ),
    );
  }
}

Widget buildList(AsyncSnapshot<MenuItems> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data.menuItems.length,
    itemBuilder: (BuildContext context, int index) {
      MenuItem item = snapshot.data.menuItems[index];

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
              return true;
            },
          ),
        ),
      );
    },
  );
}
