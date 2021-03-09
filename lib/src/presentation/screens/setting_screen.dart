import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/SettingScreen";
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('SettingScreen')),
    );
  }
}
