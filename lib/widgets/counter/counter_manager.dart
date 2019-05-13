import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/blocs/counter_bloc.dart';

class CounterManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return StreamBuilder(
      stream: counterBloc.counterStream,
      initialData: counterBloc.defaultValue,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Column(
          children: <Widget>[
            Text(snapshot.data.toString()),
            RaisedButton(
              child: Text('Increment'),
              onPressed: () =>
                  counterBloc.counterEventSink.add(CounterEvent.increment),
            ),
            RaisedButton(
              child: Text('Decrement'),
              onPressed: () =>
                  counterBloc.counterEventSink.add(CounterEvent.decrement),
            )
          ],
        );
      },
    );
  }
}
