import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class PixelPerfectScreen extends StatelessWidget {
  Widget child;

  PixelPerfectScreen(this.child) : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PixelPerfect(
          assetPath: 'assets/main-screen.jpg',
          scale: 1,
          initOpacity: 1,
          initBottom: 300,
          child: Scaffold(
            body: child,
          )),
    );
  }
}
