import 'package:finance_manager/dummydata/dummydata.dart';
import 'package:finance_manager/functions/addFunc.dart';
import 'package:finance_manager/models/transaction.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _date = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleField() {
    return TextFormField(
      controller: _title,
      decoration: InputDecoration(
        labelText: 'Title',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _description,
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildFromField() {
    return TextFormField(
      controller: _from,
      decoration: InputDecoration(
        labelText: 'From',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildToField() {
    return TextFormField(
      controller: _to,
      decoration: InputDecoration(
        labelText: 'To',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: _amount,
      decoration: InputDecoration(
        labelText: 'Amount',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              _buildTitleField(),
              _buildDescriptionField(),
              _buildFromField(),
              _buildToField(),
              _buildAmountField(),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      backgroundColor: Colors.blue),
                ),
                onPressed: () async {
                  Transaction transaction = Transaction(
                      amount: int.parse(_amount.text),
                      title: _title.text,
                      description: _description.text,
                      to: _to.text,
                      type: _to.text.toLowerCase().trim() == 'aniket' ||
                              _to.text.toLowerCase().trim() == 'himanshu'
                          ? 1
                          : 0,
                      from: _from.text,
                      date: DateTime.now());
                  await addData(transaction);
                  Navigator.pop(context);
                },
              ),
            ])),
      ),
    );
  }
}
