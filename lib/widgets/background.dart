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

          child, //Widget
        ],
      ),
    );
  }
}

class PurpleBox extends StatefulWidget {
  const PurpleBox({Key? key}) : super(key: key);

  @override
  State<PurpleBox> createState() => _PurpleBoxState();
}

class _PurpleBoxState extends State<PurpleBox> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  BoxDecoration boxDecoration()
  {
    return const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(204, 66, 63, 1),
              Color.fromRGBO(246, 155, 172, 0.4),
            ]
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1400));
    _animation = Tween<Offset>(begin: Offset(0.5, 0.5), end: Offset.zero)
        .animate(_animationController);
    _animationController.forward().whenComplete(() {
      // when animation completes, put your code here
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print(size.width);

    return Container(
      decoration: boxDecoration(),
      width: double.infinity,
      height: size.height * 0.225,
      child: Stack(
        children: [
          Positioned(
            child: SlideTransition(
              position: _animation,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 0),
                child: Image(
                  image: AssetImage("assets/images/pokeball.png"),
                  width: 200,
                ),
              ),
            ),
            left: 250,
            top: -20,
          ),
        ],
      ),
    );
  }
}