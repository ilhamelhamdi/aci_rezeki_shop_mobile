import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final int amount;
  final String description;
  final int price;
  final String? image;

  const Item(
      {required this.name,
      required this.amount,
      required this.description,
      required this.price,
      this.image});

  @override
  List<Object?> get props => <Object?>[name, amount, description, price, image];
}
