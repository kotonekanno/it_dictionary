import 'package:flutter/material.dart';

class CenteredMaxWidth extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const CenteredMaxWidth({required this.maxWidth, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth> maxWidth ? maxWidth : constraints.maxWidth;
        return Align(
          alignment: Alignment.center,
          child: SizedBox(width: width, child: child),
        );
      },
    );
  }
}