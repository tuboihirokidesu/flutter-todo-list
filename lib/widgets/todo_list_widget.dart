import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_practice/provider/todos.dart';
import 'package:widget_practice/widgets/todo_widget.dart';

class TodoListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todos = watch(todosProvider);

    return todos.todos.isEmpty
        ? Center(
            child: Text(
              'no todo',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: todos.todos.length,
            itemBuilder: (context, index) {
              final todo = todos.todos[index];

              return TodoWidget(
                todo: todo,
              );
            },
          );
  }
}
