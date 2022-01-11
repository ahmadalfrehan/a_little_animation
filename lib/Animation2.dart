import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  const Animation2({Key? key}) : super(key: key);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "created by Ahmad AL_Frehan",
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
