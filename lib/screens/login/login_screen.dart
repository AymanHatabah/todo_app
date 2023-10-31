import 'package:flutter/material.dart';
import 'package:todo/screens/login/Login_with_mvvm/login_tab_mvvm.dart';
import 'package:todo/screens/login/signup_tab.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routename="LoginScreen";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("login")),
          bottom: TabBar(tabs: [
            Tab(
              child: Text("Login",style: TextStyle(fontSize: 20),),
            ),
            Tab(
              child: Text("SignUp",style: TextStyle(fontSize: 20)),
            ),
          ]),
        ),
        body: TabBarView(children: [
          LoginTab(),SignUpTab()
        ],

        ),


      ),
    );
  }
}
