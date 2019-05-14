import 'package:flutter/material.dart';
import 'package:learn_flutter_provider/blocs/todos_bloc.dart';

class TodoDeleteDialog extends StatelessWidget {
  final TodosBloc todosBloc;
  final int index;

  TodoDeleteDialog(this.todosBloc, this.index);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete this todo?'),
      content: Text('This action cannot be undone!'),
      actions: <Widget>[
        FlatButton(
          child: Text('Discard'),
          textColor: Colors.grey,
          onPressed: () => Navigator.pop(context, false),
        ),
        FlatButton(
          child: Text('Delete'),
          onPressed: () {
            todosBloc.deleteTodo(index);
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}
