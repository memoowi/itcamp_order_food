import 'dart:io';
import 'package:order_food/drink_model.dart';
import 'package:order_food/food_model.dart';
import 'package:order_food/order_food.dart' as order_food;
import 'package:order_food/payment_model.dart';

void main() {
  String? name;
  stdout.write('Hello, welcome to Order Food!\n');
  do {
    if (name == null) {
      stdout.write('Enter your name: ');
      name = stdin.readLineSync();
    } else if (name.length < 3) {
      print('Name must be at least 3 characters long');
      stdout.write('Enter your name: ');
      name = stdin.readLineSync();
    }
  } while (name!.length < 3);
  stdout.write('\nHello, $name!\n');

  print('Enter Your Food Order: ');
  for (int i = 0; i < order_food.foodList.length; i++) {
    stdout.write(
        '${i + 1}. ${order_food.foodList[i]['name']}  - ${order_food.foodList[i]['price']}\n');
  }
  int? foodChoice;
  int? foodQuantity;
  int? spicyLevel;

  do {
    try {
      stdout.write('Enter Your Food Order: ');
      foodChoice = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid input. Please enter a number.');
    } catch (e) {
      print('An error occurred: $e');
    }
  } while (foodChoice == null ||
      foodChoice < 1 ||
      foodChoice > order_food.foodList.length);
  do {
    try {
      stdout.write('Enter Your Quantity: ');
      foodQuantity = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid input. Please enter a number.');
    } catch (e) {
      print('An error occurred: $e');
    }
  } while (foodQuantity == null || foodQuantity < 1);
  do {
    try {
      stdout.write('Enter Your Spicy Level: ');
      spicyLevel = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid input. Please enter a number.');
    } catch (e) {
      print('An error occurred: $e');
    }
  } while (spicyLevel == null || spicyLevel < 1);

  order_food.orders.add(Food(
      name: order_food.foodList[foodChoice - 1]['name'],
      price: order_food.foodList[foodChoice - 1]['price'],
      quantity: foodQuantity,
      spicyLevel: spicyLevel));

  order_food.orders.forEach((element) => element.getFoodDetails());

  print('\nEnter Your Drink Order: ');
  for (int i = 0; i < order_food.drinkList.length; i++) {
    stdout.write(
        '${i + 1}. ${order_food.drinkList[i]['name']}  - ${order_food.drinkList[i]['price']}\n');
  }

  int? drinkChoice;
  int? drinkQuantity;
  String? flavour;
  bool? isHot;

  do {
    try {
      stdout.write('Enter Your Drink Order: ');
      drinkChoice = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid input. Please enter a number.');
    } catch (e) {
      print('An error occurred: $e');
    }
  } while (drinkChoice == null ||
      drinkChoice < 1 ||
      drinkChoice > order_food.drinkList.length);

  do {
    try {
      stdout.write('Enter Your Quantity: ');
      drinkQuantity = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid input. Please enter a number.');
    } catch (e) {
      print('An error occurred: $e');
    }
  } while (drinkQuantity == null || drinkQuantity < 1);

  stdout.write('Flavour: ');
  for (int i = 0;
      i < order_food.drinkList[drinkChoice - 1]['flavour'].length;
      i++) {
    stdout.write(
        '\n${i + 1}. ${order_food.drinkList[drinkChoice - 1]['flavour'][i]}');
  }

  int? flavourChoice;
  do {
    try {
      stdout.write('\nEnter Your Flavour: ');
      flavourChoice = int.parse(stdin.readLineSync()!);
    } on FormatException {
      print('Invalid input. Please enter a number.');
    } catch (e) {
      print('An error occurred: $e');
    }
  } while (flavourChoice == null ||
      flavourChoice < 1 ||
      flavourChoice > order_food.drinkList[drinkChoice - 1]['flavour'].length);

  flavour = order_food.drinkList[drinkChoice - 1]['flavour'][flavourChoice - 1];

  int? hotChoice;
  do {
    try {
      stdout.write('Options: \n1. Hot\n2. Cold\n');
      stdout.write('Enter Your Hot/Cold: ');
      hotChoice = int.parse(stdin.readLineSync()!);
      if (hotChoice == 1) {
        isHot = true;
      } else if (hotChoice == 2) {
        isHot = false;
      } else {
        print('Invalid input. Please enter 1 or 2.');
        isHot = null;
      }
    } on FormatException {
      print('Invalid input. Please enter a number.');
    }
  } while (isHot == null || hotChoice! < 1 || hotChoice > 2);

  order_food.orders.add(Drink(
      name: order_food.drinkList[drinkChoice - 1]['name'],
      price: order_food.drinkList[drinkChoice - 1]['price'],
      quantity: drinkQuantity,
      flavour: flavour!,
      isHot: isHot));

  for (int i = 0; i < order_food.orders.length; i++) {
    if (order_food.orders[i] is Drink) {
      order_food.orders[i].getDrinkDetails();
    }
  }
  print('\nTotal Cost:');
  order_food.totalCost();

  Payment payment = Payment();
  num cost = 0;
  for (int i = 0; i < order_food.orders.length; i++) {
    cost += order_food.orders[i].price * order_food.orders[i].quantity;
  }
  payment.cost = cost;
  payment.name = name;
  print('\nEnter Your Payment Method :\n');
  stdout.write('1. Cash\n2. Credit Card\n3. Debit Card\n');

  do {
    try {
      stdout.write('Enter Your Payment Method: ');
      int paymentMethod = int.parse(stdin.readLineSync()!);
      if (paymentMethod == 1) {
        payment.type = 'Cash';
      } else if (paymentMethod == 2) {
        payment.type = 'Credit Card';
      } else if (paymentMethod == 3) {
        payment.type = 'Debit Card';
      } else {
        print('Invalid input. Please enter 1, 2 or 3.');
        payment.type = null;
      }
    } on FormatException {
      print('Invalid input. Please enter a number.');
    }
  } while (payment.type == null || payment.type == '');

  if (payment.type == 'Credit Card' || payment.type == 'Debit Card') {
    do {
      try {
        stdout.write('Enter Your Payment Type ID: ');
        payment.typeId = int.parse(stdin.readLineSync()!);
        if (payment.typeId!.toString().length < 8) {
          print('Payment Type ID must be at least 8 digits long.');
          payment.typeId = null;
        }
      } on FormatException {
        print('Invalid input. Please enter a number.');
      }
    } while (payment.typeId == null || payment.typeId!.toString().length < 8);
  }

  payment.getPaymentDetails();

  print('\nThank you for using Order Food!\n');
}
