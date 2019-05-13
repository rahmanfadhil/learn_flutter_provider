import 'package:flutter/material.dart';
import 'package:learn_flutter_provider/widgets/todos/todo_delete_dialog.dart';
import 'package:learn_flutter_provider/widgets/todos/todo_edit_dialog.dart';

import 'package:provider/provider.dart';
import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodoManager extends StatelessWidget {
  void _showEditTodoDialog(
    BuildContext context,
    TodosBloc todosBloc,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TodoEditDialog(todosBloc, index);
      },
    );
  }

  void _showDeleteTodoDialog(
      BuildContext context, TodosBloc todosBloc, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TodoDeleteDialog(todosBloc, index);
      },
    );
  }

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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                      onPressed: () =>
                          _showEditTodoDialog(context, todosBloc, index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () =>
                          _showDeleteTodoDialog(context, todosBloc, index),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
