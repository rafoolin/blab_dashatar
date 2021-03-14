import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

class ErrorScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/ErrorScreen";
  const ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorry!')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Something has gone wrong.',
                textScaleFactor: 1.8,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 300.0,
              child: FlareActor(
                "assets/animations/Teddy.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "test",
                // snapToEnd: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
