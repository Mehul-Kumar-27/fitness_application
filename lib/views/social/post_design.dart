import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../modes/post_model.dart';

class PostDesign extends StatefulWidget {
  PostDesign({super.key, required this.model, required this.context});

  Post model;

  BuildContext context;

  @override
  State<PostDesign> createState() => _PostDesignState();
}

class _PostDesignState extends State<PostDesign> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 19,
      shadowColor: Colors.grey,
      color: Colors.grey[350],
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            widget.model.postImageUrl == ""
                ? Container()
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.model.postImageUrl,
                        fit: BoxFit.fitWidth,
                        height: 180,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: widget.model.postDescription.text
                      .textStyle(GoogleFonts.raleway(fontSize: 15))
                      .overflow(TextOverflow.clip)
                      .color(Colors.black)
                      .bold
                      .make()
                      .py2()
                      .px4(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ).p12();
  }
}
