import 'package:flutter/material.dart';
import 'package:liquid_swipe_onboard_ui/OnboardScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OnBoardUi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(child: OnboardScreen()),
    );
  }
}
