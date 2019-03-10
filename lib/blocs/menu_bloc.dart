import 'dart:async';

import 'package:shopping_cart/resources/mock_data_provider.dart';
import 'package:shopping_cart/framework/bloc_base.dart';
import 'package:shopping_cart/models/menu_items.dart';

class MenuEvent extends BlocEvent {}

class MenuEventLoad extends MenuEvent {}

class MenuState extends BlocState {
  final MenuItems menu;
  final bool isLoading;

  MenuState({this.menu, this.isLoading = false});

  factory MenuState.initial() {
    return MenuState(menu: MenuItems());
  }

  factory MenuState.loading() {
    return MenuState(menu:MenuItems(), isLoading: true);
  }

  factory MenuState.fromMenuItems(MenuItems items) {
    return MenuState(menu: items);
  }

  int get length => menu.menuItems.length;
}

class MenuBloc extends BlocBase<MenuEvent, MenuState> {
  MenuBloc() : super(initialState: MenuState.initial());

  @override
  Stream<MenuState> eventHandler(MenuEvent event, MenuState state) async* {
    if (event is MenuEventLoad) {
      yield MenuState.loading();
      MenuItems items = await mockMenuProvider.fetchMenuItems();
      yield MenuState.fromMenuItems(items);
    } 
  }
}
