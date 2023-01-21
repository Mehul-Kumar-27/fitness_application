import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  late String taskId;
  late String category;
  late String dateTime;
  late String description;
  late String task;
  late String status;
  late String title;
  

  Task(
      {required this.taskId,
      required this.category,
      required this.dateTime,
      required this.description,
      required this.task,
      required this.status,
      required this.title,
      });

  Task.fromJson(Map<String, dynamic> json) {
    taskId = json["taskId"];
    category = json["category"];
    dateTime = json["dateTime"];
    description = json["description"];
    task = json["task"];
    status = json["status"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data["taskId"] = taskId;
    data["category"] = category;
    data["dateTime"] = dateTime;
    data["description"] = description;
    data["task"] = task;
    data["status"] = status;
    data["title"] = title;

    return data;
  }
}
