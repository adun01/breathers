import 'package:breather/constants/colors.dart';
import 'package:breather/models/practic.dart';

import 'package:breather/widgets/label.dart';
import 'package:flutter/material.dart';

class BreatheCard extends StatelessWidget {
  BreathePracticModel breathe;
  VoidCallback onTap;

  BreatheCard({Key? key, required this.breathe, required this.onTap})
      : super(key: key);

  String get label {
    return '${breathe.circles} CIRCLES';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 23),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topLeft,
        width: 327,
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: CustomColors.black.withOpacity(0.08),
              spreadRadius: 4,
              blurRadius: 60,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreatheLabel(
              label: label,
              fontSize: 10,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                breathe.name,
                style: TextStyle(
                    fontFamily: 'PT-Serif',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
