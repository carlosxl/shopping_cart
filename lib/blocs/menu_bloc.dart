import 'package:rxdart/rxdart.dart';

import 'package:shopping_cart/resources/repository.dart';
import 'package:shopping_cart/models/menu_items.dart';

class MenuBloc {
  final _repository = Repository();
  final _menuFetcher = BehaviorSubject<MenuItems>();

  Observable<MenuItems> get menuItems => _menuFetcher.stream;

  fetchMenuItems() async {
    MenuItems menuItems = await _repository.fetchMenuItems();
    _menuFetcher.sink.add(menuItems);
  }

  dispose() {
    _menuFetcher.close();
  }
}

final bloc = MenuBloc();