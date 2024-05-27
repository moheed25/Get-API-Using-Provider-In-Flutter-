import 'package:flutter/material.dart';
import 'package:proapi/get_provider/Model/todo_model.dart';
import 'package:proapi/get_provider/TodoProvider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http todo"),
      ),
      body: Consumer<TodoProvider>(builder: (context, notifier, child) {
        if (notifier.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (notifier.todo.isEmpty) {
          return const Center(child: Text("No Todo")); 
        } else {
          return ListView.builder(
              itemCount: notifier.todo.length,
              itemBuilder: (context, index) {
                Todo todos = notifier.todo[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(todos.id.toString()),
                  ),
                  title: Text(
                    todos.title,
                    style: TextStyle(
                        color: todos.isCompleted
                            ? Colors.grey.withOpacity(.05)
                            : Colors.black),
                  ),
                );
              });
        }
      }),
    );
  }
}
