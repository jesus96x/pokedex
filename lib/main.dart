import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "home",
      routes: {
        "home": (_) => HomeView(),
      },
      theme: AppTheme.theme,
      //theme: ,
    );
  }
}