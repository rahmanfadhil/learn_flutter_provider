import 'package:flutter/material.dart';
import 'package:learn_flutter_provider/widgets/todos/todo_create_dialog.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/widgets/shared/main_drawer.dart';
import 'package:learn_flutter_provider/widgets/todos/todo_delete_dialog.dart';
import 'package:learn_flutter_provider/widgets/todos/todo_edit_dialog.dart';
import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodosPage extends StatelessWidget {
  void _showAddTodoDialog(BuildContext context, TodosBloc todosBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TodoCreateDialog(todosBloc);
      },
    );
  }

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon:
                Icon(todosBloc.onlyImportant ? Icons.star : Icons.star_border),
            onPressed: () => todosBloc.toggleImportant(),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTodoDialog(context, todosBloc),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: todosBloc.todos.length,
        itemBuilder: (BuildContext context, int index) {
          Todo todo = todosBloc.todos[index];

          return ListTile(
            title: Text(todo.title),
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
                ),
                IconButton(
                  icon: Icon(todo.important ? Icons.star : Icons.star_border),
                  color: Colors.orange,
                  onPressed: () => todosBloc.makeFavourite(index),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
