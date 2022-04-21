import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent {
  redColor,
  greenColor
}

class ColorBlock {
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  final _outputEventController = StreamController<Color>();

  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;
  Stream<Color> get outputEventStream => _outputEventController.stream;

  ColorBlock() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ColorEvent color) {
    if (color == ColorEvent.redColor) {
      _color = Colors.red;
    } else {
      _color = Colors.green;
    }
    _outputEventController.add(_color);
  }

  void dispose() {
    _inputEventController.close();
    _outputEventController.close();
  }
}
