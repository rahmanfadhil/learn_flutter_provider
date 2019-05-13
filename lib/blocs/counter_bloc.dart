import 'package:flutter/foundation.dart';

class CounterBloc extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
