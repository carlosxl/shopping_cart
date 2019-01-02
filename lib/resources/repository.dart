import 'mock_data_provider.dart';
import '../models/menu_items.dart';

class Repository {
  final menuListProvider = MockMenuProvider();

  Future<MenuItems> fetchMenuItems() => menuListProvider.fetchMenuItems();
}