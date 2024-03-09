class Payment {
  String? name;
  num? cost;
  String? type;
  int? typeId;

  Payment({
    this.name,
    this.cost,
    this.type,
    this.typeId,
  });

  void getPaymentDetails() {
    print(
        'Payment details:\nName: $name\nPayment Type: $type\n${typeId != null ? 'Payment Type ID:' + typeId.toString() : ''}\nCost: $cost');
  }
}
