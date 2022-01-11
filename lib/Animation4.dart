import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  const Animation4({Key? key}) : super(key: key);

  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    _animation = DecorationTween(
      begin: BoxDecoration(
        color: Colors.red,
      ),
      end: BoxDecoration(
        color: Colors.blue,
      ),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBoxTransition(
        decoration: _animation,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FlutterLogo(
            size: 350,
          ),
        ),
      ),
    );
  }
}
