import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientTop extends StatelessWidget {
  GradientTop({Key? key, this.name, this.child}) : super(key: key);

  final String? name;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/gradient.png'),
              fit: BoxFit.fill
          ),
        ),
        child: child
      ),
    );
  }
}
