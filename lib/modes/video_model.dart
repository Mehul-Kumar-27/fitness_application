import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  late String postID;
  late String postImageUrl;

  Video({
    required this.postID,
    required this.postImageUrl,
  });

  Video.fromJson(Map<String, dynamic> json) {
    postID = json["postID"];
    postImageUrl = json["postImageUrl"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data["postID"] = postID;
    data["postImageUrl"] = postImageUrl;

    return data;
  }
}
