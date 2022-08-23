import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/widgets/background.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeBackground(
          child: Column(
            children: [
              Text("JD Pokedex", style: AppTheme.theme.textTheme.headline1,),
              Text("What are you looking for?", style: AppTheme.theme.textTheme.headline1,),
            ],
          ),
        ),
      ),
    );
  }
}
