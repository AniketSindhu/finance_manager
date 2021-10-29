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
}

List<Transaction> transactions = [
  Transaction(
      amount: 100,
      title: 'Lunch',
      description: 'Lunch at McDonalds',
      date: DateTime.now(),
      from: 'FNGO',
      to: 'Devlance',
      type: 0),
  Transaction(
    amount: 200,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 1,
  ),
  Transaction(
    amount: 250,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 1,
  ),
  Transaction(
    amount: 900,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 1,
  ),
  Transaction(
    amount: 190,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 0,
  ),
  Transaction(
    amount: 280,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 1,
  ),
  Transaction(
    amount: 920,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 0,
  ),
  Transaction(
    amount: 240,
    title: 'Lunch',
    description: 'Lunch at McDonalds',
    date: DateTime.now(),
    from: 'Dummy',
    to: 'Devlance',
    type: 0,
  ),
];
