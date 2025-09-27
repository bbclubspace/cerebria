import 'package:flutter/material.dart';

PageRouteBuilder pageTransition(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;

      final enterTween = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).chain(CurveTween(curve: curve));

      final exitTween = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.0, 0.0),
      ).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(enterTween),
        child: SlideTransition(
          position: secondaryAnimation.drive(exitTween),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
  );
}
