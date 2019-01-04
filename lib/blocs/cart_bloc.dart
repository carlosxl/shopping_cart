import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/menu_items.dart';

class CartBloc {
  final _cart = Cart();

  final _additionController = StreamController<MenuItem>();
  Sink<MenuItem> get addition => _additionController.sink;

  final _itemCountSubject = BehaviorSubject<int>();
  Stream<int> get itemCount => _itemCountSubject.stream;

  final _totalPriceSubject = BehaviorSubject<String>();
  Stream<String> get totalPrice => _totalPriceSubject.stream;

  CartBloc() {
    _additionController.stream.listen(_handle);
  }

  void _handle(MenuItem item) {
    _cart.add(item);
    _itemCountSubject.add(_cart.itemCount);
    _totalPriceSubject.add(_cart.totalPrice);
  }

  dispose() {
    _additionController.close();
    _itemCountSubject.close();
  }
}

final cartBloc = CartBloc();
