import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/util/apiroutes.dart';
import 'package:todo_app/util/local_storage.dart';
import 'package:http/http.dart';

Future<List<dynamic>> getUserTodos() async {
  String token = await Token.getToken("jwt");
  Response response =
      await http.get(Uri.parse(BASE_URL + "/"), headers: <String, String>{
    HttpHeaders.authorizationHeader: token,
  });

  return jsonDecode(response.body);
}

Future<String> addUserTodo(String todo) async {
  String token = await Token.getToken("jwt");
  final response = await http.post(Uri.parse(BASE_URL + "/"),
      body: jsonEncode(<String, String>{"todo": todo}),
      headers: <String, String>{
        'authorization': token,
        'Content-Type': 'application/json',
      });

  if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Failed to create todo.');
  }
}

Future<String> deleteTodo(String todo) async {
  String token = await Token.getToken("jwt");
  final response = await http.delete(Uri.parse(BASE_URL + "/"),
      body: jsonEncode(<String, String>{"todo": todo}),
      headers: <String, String>{
        'authorization': token,
        'Content-Type': 'application/json',
      });

  if (response.statusCode == 201) {
    return response.body;
  } else {
    throw Exception('Failed to delete todo.');
  }
}
