import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/menu_bloc.dart';
import 'package:shopping_cart/models/menu_items.dart';
import 'package:shopping_cart/widgets/menu_item_tile.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    bloc.fetchMenuItems();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: StreamBuilder(
        stream: bloc.menuItems,
        builder: (BuildContext context, AsyncSnapshot<MenuItems> snapshot) {
          return buildList(snapshot);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text('21'),
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () => true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildList(AsyncSnapshot<MenuItems> snapshot) {
    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: snapshot.data.menuItems.length,
      itemBuilder: (BuildContext context, int index) {
        MenuItem item = snapshot.data.menuItems[index];

        return MenuItemTile(item: item);
      },
    );
  }
}
