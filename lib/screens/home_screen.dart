import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    void usertaped(bool? value, int index) {
      setState(() {
        todolist[index][1] = !todolist[index][1];
      });
    }

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
