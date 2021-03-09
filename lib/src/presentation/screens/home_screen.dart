import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/HomeScreen";

  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('HomeScreen')),
    );
  }
}
