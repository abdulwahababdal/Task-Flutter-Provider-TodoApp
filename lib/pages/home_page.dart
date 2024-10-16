import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart'; // Ensure this is your Todo model
import 'package:todo_app/widgets/todo_tile.dart'; // Your TodoTile widget
import 'package:todo_app/provider/todo_provider.dart'; // Import your TodoProvider

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'), // Navigate to Add Page
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) => ListView.builder(
          itemCount: todoProvider.todos.length,
          itemBuilder: (context, index) {
            final todo = todoProvider.todos[index];
            return TodoTile(todo: todo); // Use TodoTile to display each todo
          },
        ),
      ),
    );
  }
}
