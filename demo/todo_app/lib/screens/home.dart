import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/shared/items.dart';
import 'package:todo_app/shared/nav.dart';
import 'package:todo_app/util/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> todos = [
    {"id": 1, "todo": "Coding"},
    {"id": 2, "todo": "Learn Docker"},
    {"id": 3, "todo": "Sleep"},
    {"id": 4, "todo": "Learn Kubernetes"}
  ];

  final TextEditingController _inputCtrl = TextEditingController();

  remove(index) {
    setState(() {
      todos.removeWhere((element) {
        return element['id'] == index;
      });
      log(todos.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BLUEACCENT,
        appBar: Nav(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: _inputCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Add todo ...",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    todos.add({
                                      "id": todos.length + 1,
                                      "todo": _inputCtrl.text
                                    });
                                  });
                                },
                                child: const Text("ADD"))))
                  ],
                ),
                Expanded(
                    child: ListView(
                        children: todos.map<Widget>((el) {
                  return listitems(el["todo"], remove, el["id"]);
                }).toList()))
              ],
            )));
  }
}
