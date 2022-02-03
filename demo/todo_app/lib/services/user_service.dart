import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:todo_app/models/user.dart';
import 'package:todo_app/util/apiroutes.dart';

Future<String> createUser(String email, String password) async {
  final response = await http.post(
    Uri.parse(BASE_URL + "/register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Failed to create User.');
  }
}

Future<String> login(String email, String password) async {
  final response = await http.post(
    Uri.parse(BASE_URL + "/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Failed to Login.');
  }
}
