import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/menu_items.dart';

class CartBloc {
  final _cart = Cart();

  final _additionController = StreamController<MenuItem>();
  Sink<MenuItem> get addition => _additionController.sink;

  final _removalController = StreamController<MenuItem>();
  Sink<MenuItem> get removal => _removalController.sink;

  final _itemCountSubject = BehaviorSubject<int>();
  Stream<int> get itemCount => _itemCountSubject.stream;

  final _totalPriceSubject = BehaviorSubject<String>();
  Stream<String> get totalPrice => _totalPriceSubject.stream;

  final _cartSubject = BehaviorSubject<Cart>();
  Stream<Cart> get cart => _cartSubject.stream;

  CartBloc() {
    _additionController.stream.listen(_handleAddition);
    _removalController.stream.listen(_handleRemoval);
  }

  void _handleAddition(MenuItem item) {
    _cart.add(item);

    _itemCountSubject.add(_cart.itemCount);
    _totalPriceSubject.add(_cart.totalPrice);
    _cartSubject.add(_cart);
  }

  void _handleRemoval(MenuItem item) {
    _cart.remove(item);

    _itemCountSubject.add(_cart.itemCount);
    _totalPriceSubject.add(_cart.totalPrice);
    _cartSubject.add(_cart);
  }

  dispose() {
    _additionController.close();
    _removalController.close();
  }
}

final cartBloc = CartBloc();
