import 'package:flutter/foundation.dart';

class Todo {
  final String title;
  final bool important;

  Todo({
    @required this.title,
    this.important = false,
  });
}

class TodosBloc extends ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  createTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  updateTodo(int id, String title) {
    _todos[id] = Todo(title: title);
    notifyListeners();
  }

  deleteTodo(int id) {
    _todos.removeAt(id);
    notifyListeners();
  }
}
