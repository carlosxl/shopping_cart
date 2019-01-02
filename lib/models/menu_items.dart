import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_items.g.dart';

abstract class MenuItems implements Built<MenuItems, MenuItemsBuilder> {
  BuiltList<MenuItem> get menuItems;

  MenuItems._();
  factory MenuItems([updates(MenuItemsBuilder b)]) = _$MenuItems;
  static Serializer<MenuItems> get serializer => _$menuItemsSerializer;
}

abstract class MenuItem implements Built<MenuItem, MenuItemBuilder> {
  int get id;

  String get label;

  @nullable
  String get description;

  String get priceString;

  MenuItem._();
  factory MenuItem([updates(MenuItemBuilder b)]) = _$MenuItem;
  static Serializer<MenuItem> get serializer => _$menuItemSerializer;
}
