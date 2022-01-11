// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'Animation2.dart';
import 'Animation3.dart';
import 'Animation4.dart';
import 'Animation5.dart';
import 'Another.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  List Screens = [
    Animation2(),
    Animation3(),
    Animation4(),
    Animation5(),
  ];
  int c = 0;

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
  List Str = [
    "Animation1",
    "Animation2",
    "Animation3",
    "Animation4",
    "Animation5",
  ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();//
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  GlobalKey<ScaffoldState> g = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Str[c]),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Another(),
                ),
              );
            },
            child: Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      body: Screens[c],
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        type: BottomNavigationBarType.fixed,
        currentIndex: c,
        key: g,
        onTap: (val) {
          setState(() {
            c = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "animation1",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.animation,
            ),
            label: "animation2",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.animation,
            ),
            label: "animation3",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.animation,
            ),
            label: "animation4",
          ),
        ],
      ),
    );
  }
}
