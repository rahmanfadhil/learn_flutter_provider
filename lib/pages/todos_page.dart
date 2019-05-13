import 'package:flutter/material.dart';

import 'package:learn_flutter_provider/widgets/shared/main_drawer.dart';
import 'package:learn_flutter_provider/widgets/todos/todo_manager.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      drawer: MainDrawer(),
      body: TodoManager(),
    );
  }
}
