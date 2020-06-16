import 'package:flutter/material.dart';

class FadeRoute extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  final animation;
  final secondaryAnimation;

  FadeRoute(this.context, this.animation, this.secondaryAnimation, this.child);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
