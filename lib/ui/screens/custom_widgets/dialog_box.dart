import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/custom_widgets/button.dart';

class DialogBox extends StatelessWidget {
  final Controller;
  VoidCallback onsave;
  VoidCallback oncaancel;
  DialogBox(
      {super.key,
      this.Controller,
      required this.oncaancel,
      required this.onsave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),

      backgroundColor: Colors.purple[200],
      content: Container(
          // decoration:
          // BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2))),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  controller: Controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Add New Task")),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  CustomButton(onpressed: onsave, text: "Save"),
                  SizedBox(
                    width: 8,
                  ),
                  CustomButton(onpressed: oncaancel, text: "Cancel")
                ],
              )
            ],
          )),
    );
  }
}
