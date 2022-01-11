import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({Key? key}) : super(key: key);

  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<AlignmentGeometry> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
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
      child: AlignTransition(
        alignment: _animation,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
