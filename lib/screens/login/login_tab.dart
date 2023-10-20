import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/screens/login/login_screen.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

class LoginTab extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return "please enter valid email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseFunction.Login(
                        emailcontroller.text, passwordcontroller.text, (user) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeLayout.routeName, (route) => false,
                          arguments: user);
                    }, (ErrorMessage) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("oops"),
                          content: Text(ErrorMessage),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("okay"))
                          ],
                        ),
                      );
                    });

                    // TODO: Perform signup
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
