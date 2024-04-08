import 'package:hive/hive.dart';

class ToDoDatabase {
  List todolist = [];
  final mybox = Hive.box("mybox");

  //get data from database

  void loadData() {
    todolist = mybox.get("TodoList");
  }
  //update data

  void updateData() {
    todolist = mybox.put("TodoList", todolist) as List;
  }
}
