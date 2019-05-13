import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodoManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodosBloc todosBloc = Provider.of<TodosBloc>(context);

    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Add todo'),
          onPressed: () => todosBloc.createTodo('Learn Flutter'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: todosBloc.todos.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(todosBloc.todos[index].title),
              );
            },
          ),
        ),
      ],
    );
  }
}
