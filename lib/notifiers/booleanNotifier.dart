import 'package:showcase/notifiers/_estatenotifier.dart';

class BooleanNotifier extends EStateNotifier<bool> {
  BooleanNotifier({bool state = false}) : super(state);
  void toggle() => state = !state;
}
