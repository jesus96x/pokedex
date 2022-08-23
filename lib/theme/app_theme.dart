import 'package:flutter/material.dart';

class AppTheme
{
  static const Color primary = Colors.white70;
  static final ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: primary,
    textTheme: TextTheme(headline1: TextStyle(fontFamily: "Pokemon")),
  );
}