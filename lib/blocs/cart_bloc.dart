import 'dart:async';

import 'package:shopping_cart/models/menu_items.dart';
import 'package:shopping_cart/framework/bloc_base.dart';

class CartEvent extends BlocEvent {
  final MenuItem item;
  final int amount;
  CartEvent({this.item, this.amount});
}

class CartEventAddition extends CartEvent {
  CartEventAddition(item, amount) : super(item: item, amount: amount);
}

class CartEventRemoval extends CartEvent {}

class CartState extends BlocState {
  Map<MenuItem, int> content;

  CartState({this.content});

  factory CartState.initial() {
    return CartState(content: {});
  }

  factory CartState.addedTo(CartState state, MenuItem item, int amount) {
    Map<MenuItem, int> newContent = Map.from(state.content);
    newContent.putIfAbsent(item, () => 0);
    newContent[item] += amount;
    return CartState(content: newContent);
  }

  factory CartState.removedFrom(CartState state, MenuItem item, int amount) {
    assert(state.content.containsKey(item),
        'Tried to remove a non-exist item from the cart.');

    Map<MenuItem, int> newContent = Map.from(state.content);
    newContent[item] -= amount;

    assert(
        newContent[item] >= 0, 'Tried to remove too many items from the cart.');

    return CartState(content: newContent);
  }

  int get totalItems => content.values.fold(0, (sum, val) => sum + val);

  String get totalPrice => content.entries
      .fold<double>(0.00, (sum, entry) => sum + entry.key.price * entry.value)
      .toStringAsFixed(2);
}

class CartBloc extends BlocBase<CartEvent, CartState> {
  CartBloc() : super(initialState: CartState.initial());

  @override
  Stream<CartState> eventHandler(CartEvent event, CartState state) async* {
    if (event is CartEventAddition) {
      yield CartState.addedTo(state, event.item, event.amount);
    } else if (event is CartEventRemoval) {
      yield CartState.removedFrom(state, event.item, event.amount);
    }
  }
}
