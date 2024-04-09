import 'package:hive/hive.dart';

class ToDoDatabase {
  List todolist = [];
  final mybox = Hive.box("mybox");
  //create initial data
  void createinitialdata() {
    todolist = [
      ["Make Tutorial", false],
      ["Go to GYM", false]
    ];
  }

  //get data from database

  void loadData() {
    todolist = mybox.get("TodoList");
  }
  //update data

  void updateData() {
    todolist = mybox.put("TodoList", todolist) as List;
  }
}
