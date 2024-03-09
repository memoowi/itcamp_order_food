import 'package:order_food/menu_model.dart';

class Food extends Menu {
  final int spicyLevel;

  Food({
    required name,
    required price,
    required quantity,
    required this.spicyLevel,
  }) : super(name: name, price: price, quantity: quantity);

  void getFoodDetails() {
    print(
        '\nFood details:\nName: $name\nPrice: $price\nQuantity: $quantity\nSpicy Level: $spicyLevel');
  }
}
