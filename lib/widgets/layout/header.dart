import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/constants/routes.dart';
import 'package:breather/widgets/circle-icon-button.dart';
import 'package:breather/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.whitePointer,
      child: SafeArea(
        child: Container(
          height: 56,
          color: CustomColors.whitePointer,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BreCircleIconButton(
                  onPressed: () {
                    navigatorPushNames(context, RoutesPath.routeMain, null);
                  },
                  icon: BreIcon(path: CustomIcons.arrowBack),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: CustomColors.lavender,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
