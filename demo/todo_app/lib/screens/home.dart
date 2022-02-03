import 'dart:developer';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/shared/items.dart';
import 'package:todo_app/shared/nav.dart';
import 'package:todo_app/util/colors.dart';
import 'package:todo_app/util/local_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> todos = [];

  final TextEditingController _inputCtrl = TextEditingController();

  remove(index) async {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  void initState() {
    verifConnection();
    getTodos();
    super.initState();
  }

  verifConnection() async {
    if (await Token.getToken("jwt") == null) {
      Navigator.of(context).popAndPushNamed("login");
    }
  }

  getTodos() async {
    var todosList = await getUserTodos();
    setState(() {
      todos.addAll(todosList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BLUEACCENT,
        appBar: Nav(context, true),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
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
                              onPressed: () async {
                                var data = await addUserTodo(_inputCtrl.text);
                                print(data);
                                setState(() {
                                  todos.add(_inputCtrl.text);
                                });
                              },
                              child: const Text("ADD"))))
                ],
              ),
              (todos != null)
                  ? Expanded(
                      child: ListView(
                          children: todos.mapIndexed<Widget>((index, el) {
                      return listitems(el, remove, index);
                    }).toList()))
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
            ])));
  }
}
