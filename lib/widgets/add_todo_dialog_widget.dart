import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/model/todo.dart';
import 'package:widget_practice/provider/todos.dart';
import 'package:widget_practice/widgets/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  static const _buttonSize = 24.0;
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Todo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TodoFormWidget(
                    onChangedTitle: (title) =>
                        setState(() => this.title = title),
                    onChangedDescription: (description) =>
                        setState(() => this.description = description),
                    onSavedTodo: addTodo,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: closeButton(
                context,
                _buttonSize,
                () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
  void addTodo() {
    final isValidate = _formKey.currentState.validate();

    if (!isValidate) {
      return;
    } else {
      final todo = Todo(
          createdTime: DateTime.now(),
          title: title,
          id: DateTime.now().toString(),
          description: description);

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }

  Widget closeButton(
    BuildContext context,
    double buttonSize,
    Function() onPressed,
  ) {
    return SizedBox(
      width: buttonSize * 1.2,
      height: buttonSize * 1.2,
      child: FloatingActionButton(
        child: Icon(
          Icons.clear,
          size: buttonSize,
          color: Colors.white,
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
