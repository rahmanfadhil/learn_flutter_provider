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

  Future<bool> _showDeleteTodoDialog(
      BuildContext context, TodosBloc todosBloc, int index) {
    return showDialog<bool>(
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
      body: ListView.separated(
        itemCount: todosBloc.todos.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Todo todo = todosBloc.todos[index];

          return Dismissible(
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            key: Key(todo.id),
            confirmDismiss: (DismissDirection direction) {
              return _showDeleteTodoDialog(context, todosBloc, index);
            },
            child: ListTile(
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
                    icon: Icon(todo.important ? Icons.star : Icons.star_border),
                    color: Colors.orange,
                    onPressed: () => todosBloc.makeFavourite(index),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
