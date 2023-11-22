import 'package:aci_rezeki_shop_mobile/data/models/response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/item_repository.dart';

class CreateItemUseCase {
  final ItemRepository _itemRepository;

  CreateItemUseCase({required ItemRepository itemRepository})
      : _itemRepository = itemRepository;

  Future<ResponseModel> execute(Item item) async {
    return await _itemRepository.createItem(item);
  }
}
