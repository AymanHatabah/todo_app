import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/base.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/screens/login/Login_with_mvvm/connector.dart';
import 'package:todo/screens/login/Login_with_mvvm/login_view_model.dart';
import 'package:todo/screens/login/login_screen.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

class LoginTab extends StatefulWidget {
  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends  BaseView<LoginViewModel,LoginTab> implements LoginConnector {
  final _formKey = GlobalKey<FormState>();

  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.connetor=this;
  }
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      builder: (context, child) =>
          Scaffold(
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
                          viewmodel.Login(
                            emailcontroller.text, passwordcontroller.text, /* () {
                            pro.initUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeLayout.routeName, (route) => false,
                           );
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
                      }*/


                          );

                          // TODO: Perform signup
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  @override
  goToHome() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeLayout.routeName, (route) => false);
  }

  @override
  LoginViewModel initMyViewModel() {
  return LoginViewModel();
  }
}


