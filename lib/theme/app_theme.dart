import 'package:flutter/material.dart';

class AppTheme
{
  static const Color primary = Color.fromRGBO(204, 66, 63, 1);
  static const Color secondary = Colors.white;
  static final ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: primary,
    textTheme: TextTheme(headline1: TextStyle(fontFamily: "Pokemon", fontSize: 22)),
  );
}