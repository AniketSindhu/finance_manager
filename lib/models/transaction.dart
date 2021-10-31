class Transaction {
  int? amount;
  String? title;
  String? description;
  DateTime? date;
  String? from;
  String? to;
  int? type;
  Transaction(
      {this.amount,
      this.title,
      this.description,
      this.date,
      this.from,
      this.to,
      this.type});

  factory Transaction.fromDocument(Map<String, dynamic>? doc) {
    return Transaction(
      amount: doc?['Amount'],
      title: doc?['Title'],
      description: doc?['Description'],
      date: DateTime.now(),
      from: doc?['From'],
      to: doc?['To'],
      type: doc?['Type'],
    );
  }
}
