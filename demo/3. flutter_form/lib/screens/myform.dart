import 'dart:developer';

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormApp"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameCtrl,
                decoration: const InputDecoration(label: Text("Firstname")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ur firstname ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameCtrl,
                decoration: const InputDecoration(label: Text("Firstname")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ur lastname';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String firstname = _lastNameCtrl.text;
                      String lastname = _lastNameCtrl.text;
                      final snackbar =
                          SnackBar(content: Text("$firstname  $lastname"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                  child: const Text("Confirm"))
            ],
          )),
    );
  }
}
