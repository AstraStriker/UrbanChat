import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class SocalIcon extends StatefulWidget {
  final String iconSrc;
  final void Function()? press;
  const SocalIcon({
    Key? key,
    required this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  State<SocalIcon> createState() => _SocalIconState();
}

class _SocalIconState extends State<SocalIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          widget.iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
