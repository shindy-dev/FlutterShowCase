import 'package:flutter/material.dart';
import 'package:showcase/notifiers/_estatenotifier.dart';

class MaterialColorNotifier extends EStateNotifier<MaterialColor> {
  MaterialColorNotifier({MaterialColor state = Colors.blue}) : super(state);
}

class ColorNotifier extends EStateNotifier<Color> {
  ColorNotifier({Color state = Colors.blue}) : super(state);
}
