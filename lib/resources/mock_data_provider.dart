import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:shopping_cart/models/menu_items.dart';
import 'package:shopping_cart/models/serializers.dart';

class MockMenuProvider {
  Future<MenuItems> fetchMenuItems() async {
    String raw = await rootBundle.loadString('assets/menu_items.json');
    final parsed = json.decode(raw);
    return serializers.deserializeWith(MenuItems.serializer, parsed);
  }
}
