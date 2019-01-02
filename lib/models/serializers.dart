import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'menu_item.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  MenuItem,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
