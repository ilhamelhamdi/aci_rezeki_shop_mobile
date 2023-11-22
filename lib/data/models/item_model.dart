import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';

class ItemModel {
  // has same property as in the domain/entities/item.dart
  final String name;
  final int amount;
  final String description;
  final int price;
  final String? image;

  ItemModel(
      {required this.name,
      required this.amount,
      required this.description,
      required this.price,
      required this.image});

  // factory constructor to create ItemModel from json
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
        name: json['name'],
        amount: json['amount'],
        description: json['description'],
        price: json['price'],
        image: json['image']);
  }

  // method to convert ItemModel to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'description': description,
      'price': price,
      'image': image
    };
  }

  // method to convert ItemModel to Item
  Item toEntity() {
    return Item(
        name: name,
        amount: amount,
        description: description,
        price: price,
        image: image);
  }

  factory ItemModel.fromEntity(Item entity) {
    return ItemModel(
        name: entity.name,
        amount: entity.amount,
        description: entity.description,
        price: entity.price,
        image: entity.image);
  }
}
