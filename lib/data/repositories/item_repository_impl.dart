import 'package:aci_rezeki_shop_mobile/data/models/item_model.dart';
import 'package:aci_rezeki_shop_mobile/data/models/response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/item_repository.dart';
import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';
import 'package:aci_rezeki_shop_mobile/data/datasources/item_remote_datasource.dart';

class ItemRepositoryImpl implements ItemRepository {
  late ItemRemoteDataSource _remoteDataSource;

  // create constructor
  ItemRepositoryImpl({required ItemRemoteDataSource datasource}) {
    _remoteDataSource = datasource;
  }

  @override
  Future<List<Item>> getAllItems() async {
    try {
      List<ItemModel> itemModelList = await _remoteDataSource.getAllItems();
      List<Item> itemList = itemModelList.map((e) => e.toEntity()).toList();
      return itemList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Item> getItemById(int id) async {
    try {
      ItemModel itemModel = await _remoteDataSource.getItemById(id);
      Item item = itemModel.toEntity();
      return item;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel> createItem(Item item) async {
    try {
      ItemModel itemModel = ItemModel.fromEntity(item);
      return await _remoteDataSource.createItem(itemModel);
    } catch (e) {
      rethrow;
    }
  }
}
