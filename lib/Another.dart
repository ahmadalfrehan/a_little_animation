import 'dart:math';

import 'package:flutter/material.dart';

class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  _AnotherState createState() => _AnotherState();
}

class _AnotherState extends State<Another> with SingleTickerProviderStateMixin {
  double widthh = 50;
  double heightt = 50;
  double bott = 200;
  double rig = 200;
  Color Col = Colors.green;
  double angle = 52;
  double val = 0;
  BorderRadius b = BorderRadius.circular(8);
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RotationTransition(
        turns: _animation,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: animation(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            Random R = Random();
            bott = R.nextInt(780).toDouble();
            rig = R.nextInt(100).toDouble();
            widthh = R.nextInt(300).toDouble();
            heightt = R.nextInt(300).toDouble();
            b = BorderRadius.circular(R.nextInt(88).toDouble());
            Col = Color.fromRGBO(
                R.nextInt(256), R.nextInt(256), R.nextInt(256), 1);
          });
        },
      ),
    );
  }

  Stack animation() {
    return Stack(
      children: [
        AnimatedPositioned(
          curve: Curves.easeIn,
          bottom: bott,
          right: rig,
          duration: Duration(seconds: 1),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 200),
            duration: Duration(seconds: 200),
            child: Container(
              width: widthh,
              height: heightt,
              color: Col,
            ),
            builder: (_, double angle, child) => Transform.rotate(
              angle: 200,
              child: child,
            ),
          ),
        ),
        AnimatedPositioned(
          curve: Curves.easeIn,
          bottom: bott,
          right: rig,
          duration: Duration(seconds: 1),
          child: AnimatedContainer(
            width: widthh,
            height: heightt,
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
              borderRadius: b,
              color: Col,
            ),
          ),
        ),
      ],
    );
  }
}
