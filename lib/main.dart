import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:shopping_cart/models/menu_item.dart';
import 'package:shopping_cart/models/serializers.dart';

Future<List<MenuItem>> loadAsset() async {
  String raw = await rootBundle.loadString('assets/menu_items.json');
  final parsedJson = json.decode(raw);
  return parsedJson
      .map(
        (s) => serializers.deserializeWith(MenuItem.serializer, s),
      )
      .toList();
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<dynamic> myL;

    rootBundle.loadString('assets/menu_items.json').then((raw) {
      final parsed = json.decode(raw);
      myL = parsed.map(
        (obj) => serializers.deserializeWith(MenuItem.serializer, obj)
      ).toList();
      print(myL);
    });

    print(myL);

    return MaterialApp(
      title: 'Food Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Apple'),
              subtitle: Text('\$16.8'),
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
            ),
          ],
        ),
      ),
    );
  }
}
