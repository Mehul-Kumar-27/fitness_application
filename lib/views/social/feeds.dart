import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../global/global.dart';
import '../../modes/post_model.dart';
import '../../services/firebase_user.dart';
import 'post_design.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  Stream? posts;
  FirebaseUserClass firebaseUserClass = FirebaseUserClass();

  @override
  void initState() {
    // TODO: implement initState

    getAllPosts(sharedPreferences!.getString("uid")!);
    super.initState();
  }

  getAllPosts(String uid) {
    firebaseUserClass.getPosts().then((value) {
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
    );
  }
}
