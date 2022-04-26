import 'package:auto_route/auto_route.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/circle-icon-button.dart';
import 'package:breather/widgets/icon.dart';
import 'package:flutter/material.dart';

class BreatheHeader extends StatelessWidget {
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
                BreatheCircleIconButton(
                  onPressed: () {
                    AutoRouter.of(context).navigate(ListPageRouter());
                  },
                  icon: BreatheIcon(path: CustomIcons.arrowBack),
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
