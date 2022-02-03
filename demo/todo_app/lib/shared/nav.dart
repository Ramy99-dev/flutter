import 'package:flutter/material.dart';
import 'package:todo_app/util/local_storage.dart';

Nav(context, showLogout) {
  return AppBar(
    title: Text("TODO APP"),
    centerTitle: true,
    actions: [
      showLogout
          ? IconButton(
              onPressed: () {
                Token.deleteToken("jwt");
                Navigator.of(context).popAndPushNamed('login');
              },
              icon: Icon(Icons.logout))
          : Container()
    ],
  );
}
