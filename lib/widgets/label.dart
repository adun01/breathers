import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';

class BreLabel extends StatelessWidget {
  String label;
  double? fontSize;
  EdgeInsets? padding;

  BreLabel({Key? key, required this.label, this.fontSize, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.selago,
        borderRadius: BorderRadius.circular(8),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      child: Text(
        label,
        style: TextStyle(
            color: CustomColors.lavender2,
            fontFamily: 'inter',
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
