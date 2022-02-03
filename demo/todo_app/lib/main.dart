import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/screens/login.dart';
import 'package:todo_app/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        routes: {
          'login': (context) => const Login(),
          'home': (context) => const Home(),
          'register': (context) => const Register()
        });
  }
}
