import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
