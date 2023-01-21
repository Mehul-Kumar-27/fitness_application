import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../global/global.dart';
import '../../modes/task_model.dart';
import '../../services/firebase_user.dart';
import 'add_to_do.dart';
import 'task_design.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  String today = DateFormat.yMMMMd("en_US").format(DateTime.now());
  Stream? tasks;
  FirebaseUserClass firebaseUserClass = FirebaseUserClass();

  @override
  void initState() {
    getToDoTasks(sharedPreferences!.getString("uid")!);
    super.initState();
  }

  getToDoTasks(String uid) {
    firebaseUserClass.getToDoList(uid).then((value) {
      setState(() {
        tasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent[200]!,
                Colors.purpleAccent[100]!,
                Colors.indigoAccent
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  today.text
                      .textStyle(GoogleFonts.poppins(
                          fontSize: 30, color: Colors.black))
                      .bold
                      .make(),
                ],
              ).px12(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  "Your Goals !"
                      .text
                      .textStyle(GoogleFonts.poppins(
                          fontSize: 18, color: Colors.black87))
                      .bold
                      .make(),
                ],
              ).px12(),
              Expanded(
                child: StreamBuilder(
                  stream: tasks,
                  builder: (context, AsyncSnapshot snapshot) {
                    return !snapshot.hasData
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              Task model = Task.fromJson(
                                  snapshot.data!.docs[index].data()!
                                      as Map<String, dynamic>);
                              return TaskDesign(
                                  task_model: model, context: context);
                            });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: Colors.deepPurpleAccent[800],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddToDoPage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
