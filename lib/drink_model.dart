import 'package:order_food/menu_model.dart';

class Drink extends Menu {
  final String flavour;
  final bool isHot;

  Drink({
    required name,
    required price,
    required quantity,
    required this.flavour,
    this.isHot = false,
  }) : super(name: name, price: price, quantity: quantity);

  void getDrinkDetails() {
    print(
        'Drink details:\nName: $name\nPrice: $price\nQuantity: $quantity\nFlavour: $flavour\nType: ${isHot ? 'Hot' : 'Cold'}');
  }
}
