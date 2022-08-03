import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(color: Colors.white, fontSize: 16),
        headline1: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 29, 112, 206)),
      fontFamily: 'Montserrat', //3
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Colors.lightGreen),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0));
            },
          ),
        ),
      ),
    );
  }
}
