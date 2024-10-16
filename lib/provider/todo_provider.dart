 import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart'; 

class TodoProvider extends ChangeNotifier {
  var todos = [
    Todo(id: 1, title: "first todo", done: false), // Make sure to include 'done'
  ];

  void addTodo({required String title}) {
    var newTodo = Todo(
      id: todos.isNotEmpty ? todos.last.id + 1 : 1, // Using 'last' for clarity
      title: title,
      done: false, // Initialize 'done' property
    );

    todos.insert(0, newTodo); // Insert at the beginning
    notifyListeners(); 
  }

  void toggleTodoDone(int id) {
    final index = todos.indexWhere((todo) => todo.id == id); // Fixed the variable name
    if (index != -1) {
      todos[index].done = !todos[index].done; // Toggle the 'done' property
      notifyListeners(); // Notify listeners
    }
  }
}
