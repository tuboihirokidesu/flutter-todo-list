import 'package:flutter/material.dart';
import 'package:widget_practice/widgets/add_todo_dialog_widget.dart';
import 'package:widget_practice/widgets/completed_todo_list.dart';
import 'package:widget_practice/widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedTodoList(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('State'),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          barrierDismissible:
              false, //barrierDismissible はダイアログ表示時の背景をタップしたときにダイアログを閉じてよいかどうか
          builder: (context) => AddTodoDialogWidget(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
