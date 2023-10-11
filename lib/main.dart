import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/styles/MyThemeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute:HomeLayout.routeName ,
      routes: {
       HomeLayout.routeName:(context) => HomeLayout()

      },

    );
  }
}

