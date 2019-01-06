import 'menu_items.dart';

class Cart {
  Map<MenuItem, CartEntry> _cartContent = {};

  CartEntry add(MenuItem item) {
    _cartContent[item] = _cartContent.putIfAbsent(item, () => CartEntry(item));
    return _cartContent[item];
  }

  int get itemCount =>
      _cartContent.values.map((entry) => entry.count).reduce((x, y) => x + y);

  String get totalPrice => _cartContent.values
      .map((entry) => entry.subTotal)
      .reduce((x, y) => x + y).toStringAsFixed(2);
}

class CartEntry {
  final MenuItem _item;
  final int _count;

  CartEntry(this._item, [this._count = 1]);

  double get subTotal => _item.price * _count;

  MenuItem get item => _item;
  int get count => _count;
}
