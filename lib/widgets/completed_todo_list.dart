import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_practice/provider/todos.dart';
import 'package:widget_practice/widgets/todo_widget.dart';

class CompletedTodoList extends ConsumerWidget {
  const CompletedTodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todosComplete = watch(todosProvider);
    return todosComplete.todoCompleted.isEmpty
        ? Center(
            child: Text(
              'no Completed todo',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            itemCount: todosComplete.todoCompleted.length,
            itemBuilder: (context, index) {
              final todo = todosComplete.todoCompleted[index];

              return TodoWidget(
                todo: todo,
              );
            },
          );
  }
}
