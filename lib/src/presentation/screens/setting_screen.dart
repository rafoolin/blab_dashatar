import 'package:flutter/material.dart';

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
          // TODO:: Define logic
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Theme'),
            subtitle: const Text('Light'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
