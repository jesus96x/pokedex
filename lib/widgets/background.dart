import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {

  final Widget child;

  const HomeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          PurpleBox(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
          ),
          child, //Widget
        ],
      ),
    );
  }
}

class PurpleBox extends StatelessWidget {
  const PurpleBox({Key? key}) : super(key: key);

  BoxDecoration boxDecoration()
  {
    return const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(63, 63, 156, 1),
              Color.fromRGBO(90, 70, 178, 1),
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print(size.width);

    return Container(
      decoration: boxDecoration(),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(
            child: Image(
              image: AssetImage("assets/images/pokeball.png"),
              width: 200,
            ),
            left: 250,
            top: -20,
          ),
        ],
      ),
    );
  }
}