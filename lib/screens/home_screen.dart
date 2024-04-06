import 'package:flutter/material.dart';
import 'package:todo_app/custom_widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: ListView(
        children: [
          ToDoTile(
            text: 'Running Day',
            taskcompleted: true,
            onchanged: (value) {},
          )
        ],
      ),
    );
  }
}
