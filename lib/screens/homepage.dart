import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_manager/dummydata/dummydata.dart';
import 'package:finance_manager/models/transaction.dart';
import 'package:finance_manager/screens/aboutUs.dart';
import 'package:finance_manager/screens/privacyPolicy.dart';
import 'package:finance_manager/theme_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finance_manager/models/transaction.dart' as trans;
import 'addTransaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Finance Manager'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
              icon: Icon(Icons.info_outline)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
              icon: Icon(Icons.privacy_tip)),
          IconButton(
              onPressed: () {
                ThemeBuilder.of(context)!.changeTheme();
              },
              icon: Icon(Icons.lightbulb_outline)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              FirebaseFirestore.instance.collection('transactions').snapshots(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snap.data == null) {
              return Center(child: Text('No data found'));
            }
            return Center(
              child: ListView.builder(
                  itemCount: snap.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = trans.Transaction.fromDocument(
                        snap.data!.docs[index].data());
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 150),
                      child: Container(
                        decoration: BoxDecoration(
                          color: doc.type == 0
                              ? Colors.red[300]
                              : Colors.green[300],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doc.title!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                doc.description!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[900]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("From: ${doc.from!}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black)),
                                  Text("To: ${doc.to!}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black)),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Amount: Rs. ${doc.amount.toString()}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Date: ${DateFormat.yMMMMd().format(doc.date!)}",
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
