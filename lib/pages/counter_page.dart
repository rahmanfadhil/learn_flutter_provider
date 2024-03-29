import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/widgets/shared/main_drawer.dart';
import 'package:learn_flutter_provider/blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      drawer: MainDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                counterBloc.counter.toString(),
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            RaisedButton(
              child: Text('Increase'),
              onPressed: () => counterBloc.counter++,
            ),
            RaisedButton(
              child: Text('Decrease'),
              onPressed: () => counterBloc.counter--,
            )
          ],
        ),
      ),
    );
  }
}
