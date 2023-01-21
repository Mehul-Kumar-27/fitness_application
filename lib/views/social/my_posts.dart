import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../global/global.dart';
import '../../modes/post_model.dart';
import '../../services/firebase_user.dart';
import 'create_post.dart';
import 'post_design.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  Stream? posts;
  FirebaseUserClass firebaseUserClass = FirebaseUserClass();

  @override
  void initState() {
    // TODO: implement initState

    getPostByUser(sharedPreferences!.getString("uid")!);
    super.initState();
  }

  getPostByUser(String uid) {
    firebaseUserClass.getUserPosts(uid).then((value) {
      setState(() {
        posts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: posts,
                builder: (context, AsyncSnapshot snapshot) {
                  return !snapshot.hasData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            Post model = Post.fromJson(
                                snapshot.data!.docs[index].data()!
                                    as Map<String, dynamic>);
                            return PostDesign(model: model, context: context);
                          });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          elevation: 8,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreatePost()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
