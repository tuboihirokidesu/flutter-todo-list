import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/provider/todos.dart';
import 'package:widget_practice/widgets/todo_widget.dart';

class CompletedTodoList extends StatelessWidget {
  const CompletedTodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todoCompleted;

    return todos.isEmpty
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
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(
                todo: todo,
              );
            },
          );
  }
}
