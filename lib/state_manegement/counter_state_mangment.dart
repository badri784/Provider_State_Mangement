import 'package:flutter/material.dart';

class CounterStateMangment extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
  }

  void downCount() {
    _counter = 0;
  }
}
