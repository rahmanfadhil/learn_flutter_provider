import 'package:flutter/material.dart';

import 'package:learn_flutter_provider/widgets/shared/main_drawer.dart';
import 'package:learn_flutter_provider/widgets/counter/counter_manager.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      drawer: MainDrawer(),
      body: CounterManager(),
    );
  }
}
