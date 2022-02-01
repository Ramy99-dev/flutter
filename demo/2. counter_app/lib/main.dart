import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Counter App"), centerTitle: true),
          body: Center(
            child: Text("${_counter}"),
          )),
    );
  }
}*/

///  Stateless Widget :
///- Only immutable (final) data .
/// - data is unchangable .

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    log("BUILD");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter App"), centerTitle: true),
        body: Center(
          child: Text("$_counter"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter++;
            if (_counter < 10) {
              setState(() {});
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}


/// Stateful widget:
/// composed of widget and state .
/// mutable(dynamic) data .
/// Use setState to update the state of a widget . 
/// Their are many librairies for state management like : 
///  - SetState
///  - Provider
///  - GetX
///  - BloC
///  - Redux ...