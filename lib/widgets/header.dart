import 'package:breather/constants/colors.dart';
import 'package:breather/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
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
                SizedBox(
                  width: 56,
                  height: 56,
                  child: MaterialButton(
                    color: CustomColors.whitePointer,
                    elevation: 0,
                    shape: const CircleBorder(),
                    onPressed: () {
                      navigatorPushNames(context, RoutesPath.routeMain, null);
                    },
                    padding: EdgeInsets.all(0),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-back.svg',
                      color: CustomColors.black,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 16),
                  width: 48,
                  height: 32,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: CustomColors.lavender,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
