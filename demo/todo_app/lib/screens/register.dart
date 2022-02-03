import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/services/user_service.dart';
import 'package:todo_app/shared/nav.dart';
import 'package:todo_app/util/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _mkey = GlobalKey<FormState>();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  bool obscure = true;
  Icon passwordIcon = const Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUEACCENT,
      appBar: Nav(context, false),
      body: Form(
        key: _mkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                              passwordIcon = !obscure
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility);
                            });
                          },
                          icon: passwordIcon),
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    obscureText: obscure,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmPasswordCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                              passwordIcon = !obscure
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility);
                            });
                          },
                          icon: passwordIcon),
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'Confirm Password',
                    ),
                    validator: (value) {
                      log(value!);
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (passwordCtrl.text != value) {
                        return "Password is not correct";
                      }
                      return null;
                    },
                    obscureText: obscure,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (_mkey.currentState!.validate()) {
                              var data = await createUser(
                                  emailCtrl.text, passwordCtrl.text);
                              if (data == "User Added Successfully") {
                                Navigator.of(context).popAndPushNamed('login');
                              }
                            }
                          },
                          child: const Text("Register")),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('login');
                          },
                          child: Text("Cancel"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
