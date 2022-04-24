import 'package:breather/widgets/breathe.dart';
import 'package:breather/widgets/layout/bottom-navigation-bar.dart';
import 'package:breather/widgets/layout/header.dart';
import 'package:flutter/material.dart';

class BreLayoutPage extends StatelessWidget {
  final Widget child;
  final Widget? customHeader;
  final Color? backgroundColor;

  BreLayoutPage({required this.child, this.customHeader, this.backgroundColor});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Column(
          children: [customHeader ?? BreHeader(), Expanded(child: child)],
        ),
      ),
      bottomNavigationBar: BreBottomNavigationBar(),
    );
  }
}
