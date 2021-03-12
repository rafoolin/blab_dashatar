import 'package:flutter/material.dart';

import '../../presentation/presentation.dart';

class SettingScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/SettingScreen";
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const ThemeSetting(),
        ],
      ),
    );
  }
}
