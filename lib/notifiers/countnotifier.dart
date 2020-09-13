import 'package:state_notifier/state_notifier.dart';

class CountNotifier extends StateNotifier<int> {
  CountNotifier(int count) : super(count);
  void increment() => state++;
  void reset() => state = 0;
}
