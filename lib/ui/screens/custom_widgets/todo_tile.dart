import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String text;
  final bool taskcompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteFunction;

  //String text;
  ToDoTile(
      {super.key,
      required this.deleteFunction,
      required this.taskcompleted,
      required this.onchanged,
      required this.text});

  void deleteaction() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.purple.shade100,
          )
        ]),
        child: Container(
          // margin: EdgeInsets.only(left: 25, right: 25, top: 25),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.purple[200],
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              //checkbox
              Checkbox(value: taskcompleted, onChanged: onchanged),

              //text

              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
