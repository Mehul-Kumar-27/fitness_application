import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserClass {
  Future<User> getCurrentUser() async {
    User currentUser = FirebaseAuth.instance.currentUser!;
    return currentUser;
  }

  Future<Stream<QuerySnapshot>> getToDoList(String uid) async {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("todo")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getUserPosts(String uid) async {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("mypost")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getPosts() async {
    return FirebaseFirestore.instance.collection("social").snapshots();
  }

  Future<Stream<QuerySnapshot>> getYogaVideos() async {
    return FirebaseFirestore.instance.collection("yoga").snapshots();
  }
}
