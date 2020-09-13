import 'package:state_notifier/state_notifier.dart';

class IsDarkNotifier extends StateNotifier<bool> {
  IsDarkNotifier() : super(false);
  void toggle(bool v) => state = v;
}
