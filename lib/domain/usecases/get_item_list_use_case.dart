import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/item_repository.dart';

class GetItemListUseCase {
  late ItemRepository _itemRepository;

  GetItemListUseCase({required ItemRepository itemRepository}) {
    _itemRepository = itemRepository;
  }

  Future<List<Item>> execute() async {
    try {
      List<Item> itemList = await _itemRepository.getAllItems();
      return itemList;
    } catch (e) {
      rethrow;
    }
  }
}