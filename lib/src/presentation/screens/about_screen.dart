import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/AboutScreen";
  const AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('AboutScreen')),
    );
  }
}
