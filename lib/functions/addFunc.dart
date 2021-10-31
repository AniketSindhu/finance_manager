import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_manager/models/transaction.dart' as tran;

addData(tran.Transaction trans) async {
  FirebaseFirestore.instance.collection('transactions').add(trans.toMap());
}
