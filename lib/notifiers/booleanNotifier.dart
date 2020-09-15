import 'package:state_notifier/state_notifier.dart';

class BooleanNotifier extends StateNotifier<bool> {
  BooleanNotifier({bool state = false}) : super(state);
  get value => state;
  void toggle(v) => state = v;
}
