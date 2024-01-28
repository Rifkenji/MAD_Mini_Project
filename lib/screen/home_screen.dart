// home_screen.dart
import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class HomeScreen extends StatelessWidget {
  final List<Todo> todos;

  HomeScreen({required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView( // Wrap with a ListView
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This is all your to-do-list'),
                // Display the list of todos
                ListView.builder(
                  shrinkWrap: true, // Use shrinkWrap to avoid unbounded height
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo.name),
                      subtitle: Text(todo.description),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
