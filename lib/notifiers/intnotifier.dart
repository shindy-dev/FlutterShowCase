import 'package:showcase/notifiers/_estatenotifier.dart';

class IntNotifier extends EStateNotifier<int> {
  IntNotifier({int state = 0}) : super(state);
  int increment() => state++;
  int decrement() => state--;
}
