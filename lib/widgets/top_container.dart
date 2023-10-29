import 'package:flutter/material.dart';
import 'package:khkt2223/theme/colors/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;

  const TopContainer(
      {Key? key, required this.height,
      required this.width,
      required this.child,
      required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: LightColors.kLavender.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
