import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  const Animation5({Key? key}) : super(key: key);

  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _animation,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Ahmad Alfrehan",
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
