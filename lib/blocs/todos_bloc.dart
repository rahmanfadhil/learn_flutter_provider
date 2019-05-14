import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final bool important;

  Todo({
    @required this.id,
    @required this.title,
    this.important = false,
  });
}

class TodosBloc extends ChangeNotifier {
  List<Todo> _todos = [];
  bool _onlyImportant = false;

  get onlyImportant => _onlyImportant;

  List<Todo> get todos => _onlyImportant
      ? List.unmodifiable(_todos.where((todo) => todo.important))
      : List.unmodifiable(_todos);

  void toggleImportant() {
    _onlyImportant = !_onlyImportant;
    notifyListeners();
  }

  void makeFavourite(int index) {
    Todo currentTodo = _todos[index];
    _todos[index] = Todo(
      id: Uuid().v4(),
      title: currentTodo.title,
      important: !currentTodo.important,
    );
    notifyListeners();
  }

  void createTodo(String title) {
    _todos.add(Todo(
      id: Uuid().v4(),
      title: title,
    ));
    notifyListeners();
  }

  void updateTodo(int id, String title) {
    _todos[id] = Todo(
      id: Uuid().v4(),
      title: title,
    );
    notifyListeners();
  }

  void deleteTodo(int id) {
    _todos.removeAt(id);
    notifyListeners();
  }
}
