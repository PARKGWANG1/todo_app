import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  bool isDone = false;
  String title;
  Todo(this.title);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _items = <Todo>[];
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("남은 할 일"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: TextField(controller: _todoController)
                  ),
                  ElevatedButton(
                      onPressed: () => _addTodo(Todo(_todoController.text)),
                      child: Text('추가'))
                ],
              ),
              Expanded(child: ListView(
                children: _items.map((todo) => _buildTodoItem(todo)).toList(),))
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildTodoItem(Todo todo) {
    return ListTile(
      onTap: () => void_toggleTodo(todo),
      title: Text(todo.title, style: todo.isDone
          ? TextStyle(
          decoration: TextDecoration.lineThrough, fontStyle: FontStyle.italic)
          : null),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever), onPressed: () => _deleteTodo(todo),),
    );
  }

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = "";
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  void_toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
}

