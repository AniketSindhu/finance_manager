import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  late String _title;
  late String _description;
  late String _from;
  late String _to;
  late String _amount;
  late String _date;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),);
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),);
  }

  Widget _buildFromField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'From',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),);
  }

  Widget _buildToField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'To',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),);
  }

  Widget _buildAmountField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Amount',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),);
  }

  Widget _buildDateField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Date',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),);
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
              _buildDateField(),
              SizedBox(height: 100,),
              RaisedButton(
                child: Text('Add Transaction', style: TextStyle(color: Colors.white, fontSize: 16, backgroundColor: Colors.blue),),
                onPressed: () => {},
              ),
            ])),
      ),
    );
  }
}
