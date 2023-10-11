import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'colors.dart';
import 'colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(


      scaffoldBackgroundColor: mint,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: primarycolor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white));

  /*static ThemeData darkTheme = ThemeData(
      textTheme: TextTheme(
          bodySmall: GoogleFonts.elMessiri(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          bodyLarge: GoogleFonts.elMessiri(
              color: Color.fromRGBO(250, 204, 29, 1), fontSize: 30, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.elMessiri(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: blackcolor,
          onPrimary: Colors.white,
          secondary: yellowcolor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: darkprimary,
          onBackground: Colors.white,
          surface: darkprimary,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          selectedItemColor:yellowcolor,
          unselectedItemColor: Colors.white,
          backgroundColor:darkprimary)
  );*/

}
