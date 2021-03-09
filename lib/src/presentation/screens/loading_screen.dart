import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/LoadingScreen";
  const LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('LoadingScreen')),
    );
  }
}
