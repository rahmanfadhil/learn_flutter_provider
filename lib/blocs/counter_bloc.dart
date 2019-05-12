import 'dart:async';

enum CounterEvent { increment, decrement }

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _counterSink => _counterStateController.sink;
  Stream<int> get counterStream => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (CounterEvent.increment == event) {
      _counter++;
    } else if (CounterEvent.decrement == event) {
      _counter--;
    }

    _counterSink.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
