import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String text;
  final bool taskcompleted;
  Function(bool?)? onchanged;

  //String text;
  ToDoTile(
      {super.key,
      required this.taskcompleted,
      required this.onchanged,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.purple[200], borderRadius: BorderRadius.circular(5)),
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
    );
  }
}
