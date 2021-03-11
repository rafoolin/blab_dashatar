import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedLoading extends StatefulWidget {
  const AnimatedLoading();
  @override
  _AnimatedLoadingState createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading>
    with TickerProviderStateMixin {
  Animation<double> _animationRotation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 500),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          _animationController.reverse();
        else if (status == AnimationStatus.dismissed)
          _animationController.forward();
      })
      ..forward();

    _animationRotation =
        Tween(begin: -pi / 4.0, end: pi / 4.0).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animationRotation,
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            angle: _animationRotation.value,
            alignment: Alignment.center,
            child: Image.asset('assets/images/empty_dashatar.png'),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
