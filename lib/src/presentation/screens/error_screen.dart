import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/ErrorScreen";
  const ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('ErrorScreen')),
    );
  }
}
