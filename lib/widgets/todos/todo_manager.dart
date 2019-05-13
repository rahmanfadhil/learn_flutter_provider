import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodoManager extends StatefulWidget {
  @override
  _TodoManagerState createState() => _TodoManagerState();
}

class _TodoManagerState extends State<TodoManager> {
  @override
  Widget build(BuildContext context) {
    final TodosBloc todosBloc = Provider.of<TodosBloc>(context);

    return StreamBuilder(
      stream: todosBloc.todoStream,
      initialData: todosBloc.defaultValue,
      builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(snapshot.data[index].title),
            );
          },
        );
      },
    );
  }
}
