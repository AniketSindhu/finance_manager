import 'package:finance_manager/screens/homepage.dart';
import 'package:finance_manager/theme_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: _brightness,
        ),
        home: MyHomePage(title: 'Finance Manager'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Initializing Firebase...',
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          } else if (snap.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Error',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          }
          return HomePage();
        });
  }
}
