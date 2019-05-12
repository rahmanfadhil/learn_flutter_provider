import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/blocs/counter_bloc.dart';
import 'package:learn_flutter_provider/counter_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => CounterBloc(),
      dispose: (_, CounterBloc bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Provider'),
        ),
        body: CounterManager(),
      ),
    );
  }
}
