import 'package:flutter/material.dart';

class AnimatedTransition extends StatelessWidget {
  final Widget child;
  final Offset? begin;
  final bool justFade;
  final AnimationController controller;

  AnimatedTransition({
    required this.child,
    this.begin,
    this.justFade = false,
    required this.controller,
  });

  late final _animation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(controller);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: justFade
          ? child
          : SlideTransition(
              position: Tween<Offset>(
                begin: begin,
                end: Offset.zero,
              ).animate(controller),
              child: child,
            ),
    );
  }
}
