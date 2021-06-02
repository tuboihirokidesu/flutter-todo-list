import 'package:flutter/material.dart';

class TodoFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  _TodoFormWidgetState createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _TextfieldGeneralWidgetState();

  SingleChildScrollView _TextfieldGeneralWidgetState() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 32),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        controller: textController,
        maxLines: 1,
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Title',
            suffixIcon: textController.text.isEmpty
                ? Container(
                    width: 0,
                  )
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      textController.clear();
                    })),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onChanged: widget.onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        autofocus: true,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: widget.description,
        onChanged: widget.onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: widget.onSavedTodo,
          child: Text('Save'),
        ),
      );
}
