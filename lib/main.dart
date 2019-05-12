import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/blocs/counter_bloc.dart';

import 'package:learn_flutter_provider/pages/counter_page.dart';
import 'package:learn_flutter_provider/pages/todos_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => CounterBloc(),
      dispose: (_, CounterBloc bloc) => bloc.dispose(),
      child: MaterialApp(
        routes: {
          '/': (BuildContext context) => CounterPage(),
          '/todos': (BuildContext context) => TodosPage(),
        },
      ),
    );
  }
}
