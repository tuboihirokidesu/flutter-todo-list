import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/page/home_page.dart';
import 'package:widget_practice/provider/todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'TodoList';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: HomePage(),
        ),
      );
}
