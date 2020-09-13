import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

class PrimaryColorNotifier extends StateNotifier<MaterialColor> {
  PrimaryColorNotifier() : super(Colors.blue);
  void changeColor(MaterialColor v) => state = v;
}
