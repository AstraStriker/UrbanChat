import 'package:flutter/material.dart';


class GradientBg extends StatelessWidget {
  GradientBg({Key? key, this.name, this.child}) : super(key: key);

  final String? name;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/gradient.png'),
            fit: BoxFit.fill
        ),
      ),
      child: child
    );
  }
}
