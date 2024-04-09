// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:todo_app/core/database/data.dart';
// import 'package:todo_app/ui/screens/custom_widgets/dialog_box.dart';
// import 'package:todo_app/ui/screens/custom_widgets/todo_tile.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final _controller = TextEditingController();
//   //late ToDoDatabase db;
//   @override
//   void initState() {
//     super.initState();
//     //db = ToDoDatabase();
//     if (mybox.get("TodoList") == Null) {
//       db.createinitialdata();
//     } else {
//       db.loadData();
//     }
//   }

//   final mybox = Hive.box('mybox');

//   //save task function

//   void saveTask() {
//     setState(() {
//       db.todolist.add([_controller.text, false]);
//     });
//     Navigator.of(context).pop();
//   }

//   //delete task function
//   void deleteTask(int index) {
//     setState(() {
//       db.todolist.removeAt(index);
//     });
//     db.updateData();
//   }

//   //todo list

//   ToDoDatabase db = ToDoDatabase();

//   //user tap checkbox function

//   void usertaped(bool? value, int index) {
//     setState(() {
//       db.todolist[index][1] = !db.todolist[index][1];
//     });
//     db.updateData();
//   }

//   void addNewtask() {
//     showDialog(
//         context: context,
//         builder: (context) => DialogBox(
//               oncaancel: () => Navigator.of(context).pop(),
//               onsave: saveTask,
//               Controller: _controller,
//             ));
//     db.updateData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[100],
//       appBar: AppBar(
//         backgroundColor: Colors.purple[200],
//         title: Text(
//           "TO DO",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),

//       //listview todo tasks
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.purple[200],
//         child: Icon(Icons.add),
//         onPressed: () {
//           addNewtask();
//         },
//       ),
//       body: ListView.builder(
//         itemCount: db.todolist.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ToDoTile(
//               deleteFunction: (p0) => deleteTask(index),
//               taskcompleted: db.todolist[index][1],
//               onchanged: (value) => usertaped(value, index),
//               text: db.todolist[index][0]);
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/database/data.dart';
import 'package:todo_app/ui/screens/custom_widgets/dialog_box.dart';
import 'package:todo_app/ui/screens/custom_widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  late ToDoDatabase db;

  @override
  void initState() {
    super.initState();
    db = ToDoDatabase();
    // Check if the TodoList key exists in the box
    if (mybox.containsKey("TodoList")) {
      db.loadData();
    } else {
      db.createinitialdata();
    }
  }

  final mybox = Hive.box('mybox');

  void saveTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  void userTapped(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !(db.todolist[index][1] as bool);
    });
    db.updateData();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        oncaancel: () => Navigator.of(context).pop(),
        onsave: saveTask,
        Controller: _controller,
      ),
    );
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[200],
        child: Icon(Icons.add),
        onPressed: addNewTask,
      ),
      body: db.todolist == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: db.todolist.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                  deleteFunction: (vl) => deleteTask(index),
                  taskcompleted: db.todolist[index][1] as bool,
                  onchanged: (value) => userTapped(value, index),
                  text: db.todolist[index][0] as String,
                );
              },
            ),
    );
  }
}
