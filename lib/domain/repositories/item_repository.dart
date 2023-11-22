import 'package:aci_rezeki_shop_mobile/data/models/response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getAllItems();
  Future<Item> getItemById(int id);
  Future<ResponseModel> createItem(Item item);
}
