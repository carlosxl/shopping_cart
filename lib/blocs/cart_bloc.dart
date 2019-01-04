import 'package:rxdart/rxdart.dart';

import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/menu_items.dart';

class CartBloc {
  final _cartSubj = BehaviorSubject<Cart>();

  Observable<Cart> get cart => _cartSubj.stream;

  addToCart(MenuItem item, int count) async {
    MenuItems menuItems = await _repository.fetchMenuItems();
    _menuFetcher.sink.add(menuItems);
  }

  dispose() {
    _menuFetcher.close();
  }
}

final bloc = MenuBloc();
