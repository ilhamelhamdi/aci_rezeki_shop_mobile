import 'package:aci_rezeki_shop_mobile/data/models/response_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:aci_rezeki_shop_mobile/data/models/item_model.dart';

class ItemRemoteDataSource {
  final CookieRequest client;
  ItemRemoteDataSource({required this.client});

  Future<List<ItemModel>> getAllItems() async {
    try {
      final List<dynamic> response = await client.get(
        'https://aci-rezeki-shop.vercel.app/json/',
      );
      return response.map((json) => ItemModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error: Cannot get items');
    }
  }

  Future<ItemModel> getItemById(int id) async {
    try {
      final Map<String, dynamic> response = await client.get(
        'https://aci-rezeki-shop.vercel.app/item/$id/',
      );
      return ItemModel.fromJson(response);
    } catch (e) {
      throw Exception('Error: Cannot get detail item with id $id');
    }
  }

  Future<ResponseModel> createItem(ItemModel itemModel) async {
    try {
      final Map<String, dynamic> response = await client.post(
        'https://aci-rezeki-shop.vercel.app/item/',
        itemModel.toJson(),
      );
      return ResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Error: Cannot create item');
    }
  }
}
