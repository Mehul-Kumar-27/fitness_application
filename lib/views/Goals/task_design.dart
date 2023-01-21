// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../modes/task_model.dart';
import 'view_to_do.dart';

class TaskDesign extends StatefulWidget {
  BuildContext context;
  Task task_model;
  TaskDesign({
    Key? key,
    required this.context,
    required this.task_model,
  }) : super(key: key);

  @override
  State<TaskDesign> createState() => _TaskDesignState();
}

class _TaskDesignState extends State<TaskDesign> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    if (widget.task_model.status == "1") {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ViewData(taskModel: widget.task_model)));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          borderOnForeground: true,
          child: Material(
            color: Colors.grey[300],
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool!;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Task: "
                        .text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w700))
                        .make(),
                    "Type: "
                        .text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w700))
                        .make(),
                    "Category: "
                        .text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w700))
                        .make(),
                    "Date: "
                        .text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w700))
                        .make()
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.task_model.title.text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w400))
                        .overflow(TextOverflow.ellipsis)
                        .make(),
                    widget.task_model.task.text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w400))
                        .make(),
                    widget.task_model.category.text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w400))
                        .make(),
                    widget.task_model.dateTime.text
                        .textStyle(GoogleFonts.openSans(
                            fontSize: 17, fontWeight: FontWeight.w400))
                        .make(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
