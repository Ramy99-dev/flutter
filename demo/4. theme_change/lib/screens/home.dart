import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Hello World"),
          ElevatedButton(onPressed: () {}, child: Text("Button"))
        ],
      ),
    );
  }
}
