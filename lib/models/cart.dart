import 'menu_items.dart';

class Cart {
  // TODO: replace with immutable object.
  Map<MenuItem, CartEntry> _cartContent = {};

  CartEntry add(MenuItem item, [int amount = 1]) {
    CartEntry entry = _cartContent.putIfAbsent(item, () => CartEntry(item));
    entry.addedToCart(amount);
    return entry;
  }

  CartEntry remove(MenuItem item, [int amount = 1]) {
    assert(_cartContent.containsKey(item));

    CartEntry entry = _cartContent[item];
    entry.removedFromCart(amount);
    if (entry.count == 0) {
      _cartContent.remove(item);
      return null;
    }

    return entry;
  }

  int get itemCount => _cartContent.isEmpty
      ? 0
      : _cartContent.values.map((entry) => entry.count).reduce((x, y) => x + y);

  String get totalPrice => _cartContent.isEmpty
      ? '0.00'
      : _cartContent.values
          .map((entry) => entry.subTotal)
          .reduce((x, y) => x + y)
          .toStringAsFixed(2);

  CartEntry getEntry(MenuItem item) {
    return _cartContent[item];
  }
}

class CartEntry {
  final MenuItem _item;
  int _count;

  CartEntry(this._item, [this._count = 0]);

  double get subTotal => _item.price * _count;

  MenuItem get item => _item;
  int get count => _count;

  int addedToCart(int amount) {
    _count += amount;
    return _count;
  }

  int removedFromCart(int amount) {
    _count = _count - amount < 0 ? 0 : _count - amount;
    return _count;
  }
}
