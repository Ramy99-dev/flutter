import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

listitems(String item, Function remove, int index) {
  return Row(
    children: [
      Expanded(flex: 1, child: Text(item)),
      IconButton(
          onPressed: () {
            remove(index);
          },
          icon: Icon(Icons.cancel))
    ],
  );
}
