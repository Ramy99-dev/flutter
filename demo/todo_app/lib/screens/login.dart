import 'package:flutter/material.dart';
import 'package:todo_app/services/user_service.dart';
import 'package:todo_app/shared/nav.dart';
import 'package:todo_app/util/colors.dart';
import 'package:todo_app/util/local_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _mkey = GlobalKey<FormState>();
  bool obscure = true;
  Icon passwordIcon = const Icon(Icons.visibility);
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUEACCENT,
      appBar: Nav(context, false),
      body: Form(
        key: _mkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailCtrl,
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
                controller: _passwordCtrl,
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
              ElevatedButton(
                  onPressed: () async {
                    if (_mkey.currentState!.validate()) {
                      var data =
                          await login(_emailCtrl.text, _passwordCtrl.text);
                      if (data.length > 15) {
                        await Token.addToken("jwt", data);
                        Navigator.of(context).popAndPushNamed('home');
                      }
                    }
                  },
                  child: const Text("Login")),
              GestureDetector(
                child: const Text("Create Account",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white)),
                onTap: () {
                  Navigator.popAndPushNamed(context, "register");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
