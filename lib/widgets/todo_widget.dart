import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:widget_practice/model/todo.dart';
import 'package:widget_practice/page/edit_todo_page.dart';
import 'package:widget_practice/provider/todos.dart';
import 'package:widget_practice/provider/utils.dart';

class TodoWidget extends ConsumerWidget {
  final Todo todo;
  const TodoWidget({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todos = watch(todosProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo, todos),
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context, todos)),
    );
  }

  Widget buildTodo(BuildContext context, TodosProvider todos) =>
      GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                  value: todo.isDone,
                  onChanged: (_) {
                    // final provider =
                    //     Provider.of<TodosProvider>(context, listen: false);
                    // final isDone = provider.toggleTodoStatus(todo);

                    Utils.showSnackBar(
                        context,
                        todos.toggleTodoStatus(todo)
                            ? 'Completed'
                            : 'not Completed');
                  }),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
              Text(
                DateFormat('M月d日').format(todo.createdTime),
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo, TodosProvider todos) {
    // final provider = Provider.of<TodosProvider>(context, listen: false);
    // provider.removeTodo(todo);
    todos.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo)),
    );
  }
}
