import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  late String postID;
  late String postImageUrl;

  late String postDescription;
  late String userID;
  late String userName;

  Post({
    required this.postID,
    required this.postImageUrl,
    required this.postDescription,
    required this.userID,
    required this.userName,
  });

  Post.fromJson(Map<String, dynamic> json) {
    postID = json["postID"];
    postImageUrl = json["postImageUrl"];

    postDescription = json["postDescription"];
    userID = json["userID"];
    userName = json["userName"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data["postID"] = postID;
    data["postImageUrl"] = postImageUrl;

    data["postDescription"] = postDescription;
    data["userID"] = userID;
    data["userName"] = userName;

    return data;
  }
}
