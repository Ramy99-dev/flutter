import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/todo_service.dart';

listitems(String item, Function remove, int index) {
  return Row(
    children: [
      Expanded(flex: 1, child: Text(item)),
      IconButton(
          onPressed: () async {
            await deleteTodo(item);
            print(index);
            remove(index);
          },
          icon: Icon(Icons.cancel))
    ],
  );
}
