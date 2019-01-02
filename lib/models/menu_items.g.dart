// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_items.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuItems> _$menuItemsSerializer = new _$MenuItemsSerializer();
Serializer<MenuItem> _$menuItemSerializer = new _$MenuItemSerializer();

class _$MenuItemsSerializer implements StructuredSerializer<MenuItems> {
  @override
  final Iterable<Type> types = const [MenuItems, _$MenuItems];
  @override
  final String wireName = 'MenuItems';

  @override
  Iterable serialize(Serializers serializers, MenuItems object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'menuItems',
      serializers.serialize(object.menuItems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MenuItem)])),
    ];

    return result;
  }

  @override
  MenuItems deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'menuItems':
          result.menuItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(MenuItem)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItemSerializer implements StructuredSerializer<MenuItem> {
  @override
  final Iterable<Type> types = const [MenuItem, _$MenuItem];
  @override
  final String wireName = 'MenuItem';

  @override
  Iterable serialize(Serializers serializers, MenuItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'label',
      serializers.serialize(object.label,
          specifiedType: const FullType(String)),
      'priceString',
      serializers.serialize(object.priceString,
          specifiedType: const FullType(String)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  MenuItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'priceString':
          result.priceString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItems extends MenuItems {
  @override
  final BuiltList<MenuItem> menuItems;

  factory _$MenuItems([void updates(MenuItemsBuilder b)]) =>
      (new MenuItemsBuilder()..update(updates)).build();

  _$MenuItems._({this.menuItems}) : super._() {
    if (menuItems == null) {
      throw new BuiltValueNullFieldError('MenuItems', 'menuItems');
    }
  }

  @override
  MenuItems rebuild(void updates(MenuItemsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemsBuilder toBuilder() => new MenuItemsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItems && menuItems == other.menuItems;
  }

  @override
  int get hashCode {
    return $jf($jc(0, menuItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItems')
          ..add('menuItems', menuItems))
        .toString();
  }
}

class MenuItemsBuilder implements Builder<MenuItems, MenuItemsBuilder> {
  _$MenuItems _$v;

  ListBuilder<MenuItem> _menuItems;
  ListBuilder<MenuItem> get menuItems =>
      _$this._menuItems ??= new ListBuilder<MenuItem>();
  set menuItems(ListBuilder<MenuItem> menuItems) =>
      _$this._menuItems = menuItems;

  MenuItemsBuilder();

  MenuItemsBuilder get _$this {
    if (_$v != null) {
      _menuItems = _$v.menuItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItems other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItems;
  }

  @override
  void update(void updates(MenuItemsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItems build() {
    _$MenuItems _$result;
    try {
      _$result = _$v ?? new _$MenuItems._(menuItems: menuItems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menuItems';
        menuItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuItems', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MenuItem extends MenuItem {
  @override
  final int id;
  @override
  final String label;
  @override
  final String description;
  @override
  final String priceString;

  factory _$MenuItem([void updates(MenuItemBuilder b)]) =>
      (new MenuItemBuilder()..update(updates)).build();

  _$MenuItem._({this.id, this.label, this.description, this.priceString})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('MenuItem', 'id');
    }
    if (label == null) {
      throw new BuiltValueNullFieldError('MenuItem', 'label');
    }
    if (priceString == null) {
      throw new BuiltValueNullFieldError('MenuItem', 'priceString');
    }
  }

  @override
  MenuItem rebuild(void updates(MenuItemBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemBuilder toBuilder() => new MenuItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItem &&
        id == other.id &&
        label == other.label &&
        description == other.description &&
        priceString == other.priceString;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), label.hashCode), description.hashCode),
        priceString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItem')
          ..add('id', id)
          ..add('label', label)
          ..add('description', description)
          ..add('priceString', priceString))
        .toString();
  }
}

class MenuItemBuilder implements Builder<MenuItem, MenuItemBuilder> {
  _$MenuItem _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _priceString;
  String get priceString => _$this._priceString;
  set priceString(String priceString) => _$this._priceString = priceString;

  MenuItemBuilder();

  MenuItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _label = _$v.label;
      _description = _$v.description;
      _priceString = _$v.priceString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItem;
  }

  @override
  void update(void updates(MenuItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItem build() {
    final _$result = _$v ??
        new _$MenuItem._(
            id: id,
            label: label,
            description: description,
            priceString: priceString);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
