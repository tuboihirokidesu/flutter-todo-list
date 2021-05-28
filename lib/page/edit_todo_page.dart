import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/model/todo.dart';
import 'package:widget_practice/provider/todos.dart';
import 'package:widget_practice/widgets/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  final titleContoroller = TextEditingController();
  String title;
  String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Page'),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  provider.removeTodo(widget.todo);

                  Navigator.of(context).pop();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValite = _formKey.currentState.validate();

    if (!isValite) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
