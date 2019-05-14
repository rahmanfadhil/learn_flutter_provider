import 'package:flutter/material.dart';

import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodoCreateDialog extends StatefulWidget {
  final TodosBloc todosBloc;

  TodoCreateDialog(this.todosBloc);

  @override
  _TodoCreateDialogState createState() => _TodoCreateDialogState();
}

class _TodoCreateDialogState extends State<TodoCreateDialog> {
  TextEditingController _todoInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Todo'),
      content: TextField(
        controller: _todoInputController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Discard'),
          textColor: Colors.grey,
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('Create'),
          onPressed: () {
            widget.todosBloc.createTodo(_todoInputController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
