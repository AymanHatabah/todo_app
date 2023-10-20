import 'package:flutter/material.dart';
import 'package:todo/screens/login/login_screen.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

class SignUpTab extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var agecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: namecontroller,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: agecontroller,
                  decoration: const InputDecoration(labelText: 'age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(labelText: 'email'),
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
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseFunction.createuser(
                          emailcontroller.text, passwordcontroller.text,
                              () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.routename, (route) => false);
                      },
                              (message) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error"),
                            content: Text(message),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("okay"))
                            ],
                          ),
                        );
                      }, namecontroller.text,
                          int.parse(agecontroller.text));

                      // TODO: Perform signup
                    }
                  },
                  child: const Text('Sign  up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
