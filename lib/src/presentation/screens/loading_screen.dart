import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

class LoadingScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/LoadingScreen";
  const LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading...')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Please be patient!',
                textScaleFactor: 1.8,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 300.0,
              child: FlareActor(
                "assets/animations/robo_read.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "read",
                snapToEnd: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
