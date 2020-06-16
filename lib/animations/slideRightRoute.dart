import 'package:flutter/material.dart';

class SlideRightRoute extends StatelessWidget {
  final BuildContext context;
  final Widget child;
  final animation;
  final secondaryAnimation;

  SlideRightRoute(
      this.context, this.animation, this.secondaryAnimation, this.child);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
