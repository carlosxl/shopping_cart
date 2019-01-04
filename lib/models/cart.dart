import 'menu_items.dart';

class Cart {
  Map<MenuItem, int> _cartItems = {};

  Map<MenuItem, int> get cartItems => _cartItems;

  MenuItem add(MenuItem item) {
    _cartItems[item] = _cartItems.putIfAbsent(item, () => 0) + 1;
    return item;
  }

  int get itemCount => _cartItems.values.reduce((x, y) => x + y);

  String get totalPrice {
    double total = .0;
    _cartItems.forEach((item, count) {
      total += double.parse(item.priceString.replaceFirst('\$', '')) * count;
    });
    return total.toStringAsFixed(2);
  }
}
