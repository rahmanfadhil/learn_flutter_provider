// import 'dart:async';
// import 'package:flutter/material.dart';

// class TodoEvent {}

// class CreateTodoEvent extends TodoEvent {
//   final Todo todo;
//   CreateTodoEvent({@required this.todo});
// }

// class Todo {
//   final String title;
//   final bool important;

//   Todo({
//     @required this.title,
//     @required this.important,
//   });
// }

// class TodosBloc {
//   List<Todo> _todos = [];
//   List<Todo> get defaultValue => _todos;

//   final _todoStateController = StreamController<List<Todo>>.broadcast();
//   StreamSink<List<Todo>> get _todoStateSink => _todoStateController.sink;
//   Stream<List<Todo>> get todoStream => _todoStateController.stream;

//   final _todoEventController = StreamController<TodoEvent>();
//   StreamSink<TodoEvent> get todoEventSink => _todoEventController.sink;
//   Stream<TodoEvent> get _todoEventStream => _todoEventController.stream;

//   TodosBloc() {
//     _todoEventStream.listen(_mapEventToState);
//   }

//   void _mapEventToState(TodoEvent event) {
//     if (event is CreateTodoEvent) {
//       _todos.add(event.todo);
//     }

//     _todoStateSink.add(_todos);
//   }

//   void dispose() {
//     _todoStateController.close();
//     _todoEventController.close();
//   }
// }

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
}
