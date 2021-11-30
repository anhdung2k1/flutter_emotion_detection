import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFD8EEFE),
    fontFamily: 'Montserrat',
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
InputDecorationTheme inputDecorationTheme(){
  return const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      hintStyle: TextStyle(
      color: Color(0xFFC6C6C6),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 2,
      ),
      labelStyle: TextStyle(
      color:  Color(0xFF313131),
      fontSize: 20,
      fontWeight: FontWeight.w400,
      )
  );
}
AppBarTheme appBarTheme(){
  return const AppBarTheme(
    backgroundColor: Color(0xFF094067),
    elevation: 0,
    // ignore: deprecated_member_use
    brightness: Brightness.dark,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
    )
  );
}