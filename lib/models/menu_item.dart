import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_item.g.dart';

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
