List<Map<String, dynamic>> foodList = [
  {
    'name': 'Nasi Goreng',
    'price': 15000,
  },
  {
    'name': 'Ayam Geprek',
    'price': 12000,
  },
  {
    'name': 'Ayam Bakar',
    'price': 10000,
  },
];

List<Map<String, dynamic>> drinkList = [
  {
    'name': 'Teh',
    'price': 5000,
    'flavour': ['Manis', 'Tawar'],
  },
  {
    'name': 'Kopi',
    'price': 7000,
    'flavour': ['Latte', 'Cappucino', 'Espresso'],
  },
  {
    'name': 'Susu',
    'price': 8000,
    'flavour': ['Coklat', 'Vanila'],
  },
];

List<dynamic> orders = [];

void totalCost() {
  num total = 0;
  for (int i = 0; i < orders.length; i++) {
    total += orders[i].price * orders[i].quantity;
    print(
        '${orders[i].name} x ${orders[i].quantity} -> ${orders[i].price}/each = ${orders[i].quantity * orders[i].price}');
  }
  print('Total Cost: $total');
}
