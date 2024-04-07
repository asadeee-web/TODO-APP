import 'package:flutter/material.dart';
import 'package:todo_app/custom_widgets/button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: Container(
          // decoration:
          // BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2))),
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Add New Task")),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  CustomButton(onpressed: () {}, text: "Save"),
                  CustomButton(onpressed: () {}, text: "Cancel")
                ],
              )
            ],
          )),
    );
  }
}
