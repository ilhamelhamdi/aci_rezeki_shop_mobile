import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/item_repository.dart';

class GetItemDetailUseCase {
  late ItemRepository _itemRepository;

  GetItemDetailUseCase({required ItemRepository itemRepository}) {
    _itemRepository = itemRepository;
  }

  Future<Item> execute(int id) async {
    try {
      Item item = await _itemRepository.getItemById(id);
      return item;
    } catch (e) {
      rethrow;
    }
  }
}