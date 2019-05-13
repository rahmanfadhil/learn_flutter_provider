import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/blocs/counter_bloc.dart';

class CounterManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return Column(
      children: <Widget>[
        Text(counterBloc.counter.toString()),
        RaisedButton(
          child: Text('Increment'),
          onPressed: () => counterBloc.counter++,
        ),
        RaisedButton(
          child: Text('Decrease'),
          onPressed: () => counterBloc.counter--,
        )
      ],
    );
  }
}
