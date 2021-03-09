import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/MainScreen";
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('MainScreen')),
    );
  }
}
