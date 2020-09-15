import 'package:state_notifier/state_notifier.dart';

class IntNotifier extends StateNotifier<int> {
  IntNotifier(int count) : super(count);
  void increment() => state++;
  void reset() => state = 0;
}
