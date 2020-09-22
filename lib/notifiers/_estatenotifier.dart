import 'package:state_notifier/state_notifier.dart';

class EStateNotifier<T> extends StateNotifier<T> {
  EStateNotifier(T state)
      : _default = state,
        super(state);
  T _default;
  T setState(T v) => state = v;
  T reset() => state = _default;
}
