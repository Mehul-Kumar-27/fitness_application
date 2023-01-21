import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../dialogs/loading_dialog.dart';
import '../../global/global.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  XFile? imageXfile;

  final ImagePicker _picker = ImagePicker();
  String postImageUrl = "";

  bool upload = false;
  String postId = DateTime.now().millisecondsSinceEpoch.toString();

  TextEditingController _description = TextEditingController();

  Future<void> _getImage() async {
    imageXfile = await _picker.pickImage(source: ImageSource.gallery);
    // videoXfile = await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      imageXfile;
    });
  }

  Future<void> uploadPost() async {
    String postID = DateTime.now().millisecondsSinceEpoch.toString();
    if (imageXfile == null) {
      //// Upload only the text post
      showDialog(
          context: context,
          builder: (context) {
            return const LoadingDialog(
              message: "Please wait while we create post .....",
            );
          });

      uploadForUser(postID);
      uploadForEveryOne(postID);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const LoadingDialog(
              message: "Please wait while we create post .....",
            );
          });
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      fStorage.Reference reference = fStorage.FirebaseStorage.instance
          .ref()
          .child("PostUrls")
          .child(fileName);

      fStorage.UploadTask uploadTask =
          reference.putFile(File(imageXfile!.path));

      fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      await taskSnapshot.ref.getDownloadURL().then((url) {
        postImageUrl = url;
      });

      uploadForUser(postID);
      uploadForEveryOne(postID);
    }
  }

  void uploadForEveryOne(String postID) {
    FirebaseFirestore.instance.collection("social").doc(postID).set({
      "postID": postId,
      "postImageUrl": postImageUrl,
      "postDescription": _description.text,
      "userID": sharedPreferences!.getString("uid"),
      "userName": sharedPreferences!.getString("name")
    });
  }

  void uploadForUser(String postID) {
    FirebaseFirestore.instance
        .collection("user")
        .doc(sharedPreferences!.getString("uid"))
        .collection("mypost")
        .doc(postId)
        .set({
      "postID": postId,
      "postImageUrl": postImageUrl,
      "postDescription": _description.text,
      "userID": sharedPreferences!.getString("uid"),
      "userName": sharedPreferences!.getString("name")
    }).then((value) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.purpleAccent[200]!,
                  Colors.blueAccent[400]!,
                  Colors.indigoAccent
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 0.4, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              upload ? const LinearProgressIndicator() : Container(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _getImage();
                        },
                        child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.1,
                            backgroundColor: Colors.grey[600],
                            backgroundImage: imageXfile == null
                                ? null
                                : FileImage(File(imageXfile!.path)),
                            child: imageXfile == null
                                ? Icon(
                                    Icons.add_a_photo_outlined,
                                    size:
                                        MediaQuery.of(context).size.width * 0.1,
                                    color: Colors.white,
                                  )
                                : null),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      "Add image to post"
                          .text
                          .textStyle(GoogleFonts.poppins(
                              fontSize: 10, color: Colors.white))
                          .make()
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              description().p16(),
              const SizedBox(
                height: 30,
              ),
              upload
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.grey[800]!,
                                Colors.black87
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: const [0.0, 0.5, 1.0],
                              tileMode: TileMode.clamp),
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 60,
                      child: Lottie.asset("assets/animations/upload.json"),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          upload = true;
                        });
                        uploadPost().then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.grey[800]!,
                                  Colors.black87
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 0.5, 1.0],
                                tileMode: TileMode.clamp),
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 60,
                        child: Lottie.asset("assets/animations/upload.json"),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 56, 47, 47),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _description,
        maxLines: null,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Description",
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 17),
          contentPadding: EdgeInsets.only(left: 20, right: 20),
        ),
      ),
    ).py12();
  }
}
