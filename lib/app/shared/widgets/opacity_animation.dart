import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class OpacityAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  OpacityAnimation({this.delay, this.child});

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: 0.0.tweenTo(1.0),
      duration: Duration(milliseconds: 500),
      child: child,
      builder: (context, child, value) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}
