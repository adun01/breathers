import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreCircleIconButton extends StatelessWidget {
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;
  final Widget icon;

  BreCircleIconButton(
      {Key? key,
      required this.onPressed,
      this.size = 56,
      this.color = CustomColors.whitePointer,
      required this.icon});

  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      minWidth: size,
      height: size,
      color: color,
      elevation: 0,
      shape: const CircleBorder(),
      onPressed: onPressed,
      padding: EdgeInsets.all(0),
      child: icon,
    );
  }
}
