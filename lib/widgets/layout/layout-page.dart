import 'package:breather/widgets/layout/header.dart';
import 'package:flutter/material.dart';

class BreLayoutPage extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  BreLayoutPage({required this.child, this.backgroundColor});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Column(
          children: [BreHeader(), Expanded(child: child)],
        ),
      ),
    );
  }
}
