import 'package:finance_manager/dummydata/dummydata.dart';
import 'package:finance_manager/screens/aboutUs.dart';
import 'package:finance_manager/screens/privacyPolicy.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              icon: Icon(Icons.privacy_tip))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                child: Container(
                  decoration: BoxDecoration(
                    color: transactions[index].type == 0
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
                          transactions[index].title!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          transactions[index].description!,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[900]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("From: ${transactions[index].from!}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            Text("To: ${transactions[index].to!}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "Amount: Rs. ${transactions[index].amount.toString()}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date: ${DateFormat.yMMMMd().format(transactions[index].date!)}",
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
