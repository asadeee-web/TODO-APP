import 'package:flutter/material.dart';
import 'package:todo_app/custom_widgets/dialog_box.dart';
import 'package:todo_app/custom_widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todolist = [
    ["Running Day", false],
    ["Working Day", false],
    ["Exercise Day", false],
    ["Vecation Day", false],
  ];
  void usertaped(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void addNewtask() {
    showDialog(context: context, builder: (context) => DialogBox());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      //listview todo tasks
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[200],
        child: Icon(Icons.add),
        onPressed: () {
          addNewtask();
        },
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
              taskcompleted: todolist[index][1],
              onchanged: (value) => usertaped(value, index),
              text: todolist[index][0]);
        },
      ),
    );
  }
}
