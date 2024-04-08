import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/database/data.dart';
import 'package:todo_app/ui/screens/custom_widgets/dialog_box.dart';
import 'package:todo_app/ui/screens/custom_widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    db.loadData();
  }

  final mybox = Hive.box('mybox');

  //save task function

  void saveTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //delete task function
  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  //todo list

  ToDoDatabase db = ToDoDatabase();

  //user tap checkbox function

  void usertaped(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }

  void addNewtask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              oncaancel: () => Navigator.of(context).pop(),
              onsave: saveTask,
              Controller: _controller,
            ));
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
        itemCount: db.todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
              deleteFunction: (p0) => deleteTask(index),
              taskcompleted: db.todolist[index][1],
              onchanged: (value) => usertaped(value, index),
              text: db.todolist[index][0]);
        },
      ),
    );
  }
}
