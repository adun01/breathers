import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class PixelPerfectScreen extends StatelessWidget {
  Widget child;

  PixelPerfectScreen(this.child) : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PixelPerfect(
          assetPath: 'assets/123.jpg', // path to your asset image
          scale: 1, // scale value (optional)
          // initBottom: 20, //  default bottom distance (optional)
          offset: Offset.zero, // default image offset (optional)
          initOpacity: 1, // init opacity value (optional)
          child: Scaffold(
            body: child,
          )),
    );
  }
}
