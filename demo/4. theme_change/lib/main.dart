import 'package:flutter/material.dart';
import 'package:theme_change/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;
  ThemeData theme = ThemeData.light();
  String titleText = "White";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
            appBar: AppBar(
              title: Text(titleText),
              centerTitle: true,
              actions: [
                Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = !isSwitched;
                        if (isSwitched) {
                          setState(() {
                            theme = ThemeData.dark();
                            titleText = "Dark";
                          });
                        } else {
                          setState(() {
                            theme = ThemeData.light();
                            titleText = "White";
                          });
                        }
                      });
                    })
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Home(),
            )));
  }
}
