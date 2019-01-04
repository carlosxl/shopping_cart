import 'package:flutter/material.dart';

import 'package:shopping_cart/blocs/menu_bloc.dart';
import 'package:shopping_cart/blocs/cart_bloc.dart';
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
          title: Text('饱了么'),
        ),
        body: StreamBuilder(
          stream: menuBloc.menuItems,
          builder: (BuildContext context, AsyncSnapshot<MenuItems> snapshot) {
            return buildList(snapshot);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                StreamBuilder(
                  stream: cartBloc.totalPrice,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    TextStyle style = TextStyle(fontSize: 24.0, color: Theme.of(context).primaryColorDark);
                    if (snapshot.hasData) {
                      return Text('总价：${snapshot.data}', style: style);
                    }
                    return Text('尚未添加物品', style: style);
                  },
                ),
                StreamBuilder(
                  stream: cartBloc.itemCount,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    TextStyle style = TextStyle(fontSize: 12.0, color: Theme.of(context).primaryColorDark);
                    if (snapshot.hasData) {
                      return Text('(${snapshot.data}件物品)', style: style);
                    }
                    return Text('', style: style);
                  },
                ),
              ],
            ),
          ),
          color: Theme.of(context).dialogBackgroundColor,
          notchMargin: 6.0,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () => true,
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
