import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

class ColorNotifier extends StateNotifier<MaterialColor> {
  ColorNotifier({Color state = Colors.blue}) : super(state);
  void changeColor(Color v) => state = v;
}
