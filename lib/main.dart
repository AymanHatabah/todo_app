import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/screens/login/login_screen.dart';
import 'package:todo/styles/MyThemeData.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      initialRoute:LoginScreen.routename ,
      routes: {
       HomeLayout.routeName:(context) => HomeLayout(),
        LoginScreen.routename:(context) => LoginScreen()

      },

    );
  }
}

