import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/FavoriteScreen";
  const FavoriteScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('FavoriteScreen')),
    );
  }
}
