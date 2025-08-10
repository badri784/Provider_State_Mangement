import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStateMangment extends StateNotifier<int> {
  CounterStateMangment() : super(0);

  void increment() {
    state++;
  }

  void downCount() {
    state--;
  }

  void resetCount() {
    state = 0;
  }
}

final counterprovider = StateNotifierProvider<CounterStateMangment, int>(
  (_) => CounterStateMangment(),
);
