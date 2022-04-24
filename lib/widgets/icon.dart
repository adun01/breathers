import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreIcon extends StatelessWidget {
  final String path;
  Color? color = CustomColors.black;

  BreIcon({Key? key, required this.path, this.color});

  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color,
    );
  }
}
