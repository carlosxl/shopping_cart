import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/menu_bloc.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';
import 'package:shopping_cart/models/menu_items.dart';
import 'package:shopping_cart/widgets/menu_app_bar.dart';
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
    menuBloc.fetchMenuItems();
  }

  @override
  void dispose() {
    menuBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedMenuScreen(
      bloc: cartBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Are You Full?'),
        ),
        body: StreamBuilder(
          stream: menuBloc.menuItems,
          builder: (BuildContext context, AsyncSnapshot<MenuItems> snapshot) {
            return buildList(snapshot);
          },
        ),
        bottomNavigationBar: MenuAppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed((context), '/cart');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
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

class InheritedMenuScreen extends InheritedWidget {
  final CartBloc bloc;

  InheritedMenuScreen({this.bloc, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static InheritedMenuScreen of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedMenuScreen);
}
