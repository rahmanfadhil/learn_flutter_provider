import 'package:flutter/material.dart';

import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodoEditDialog extends StatefulWidget {
  final TodosBloc todosBloc;
  final int index;

  TodoEditDialog(this.todosBloc, this.index);

  @override
  State<StatefulWidget> createState() {
    return _TodoEditDialogState();
  }
}

class _TodoEditDialogState extends State<TodoEditDialog> {
  TextEditingController _todoInputController;

  @override
  void initState() {
    super.initState();
    _todoInputController =
        TextEditingController(text: widget.todosBloc.todos[widget.index].title);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit todo'),
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
          child: Text('Update'),
          onPressed: () {
            widget.todosBloc
                .updateTodo(widget.index, _todoInputController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
