// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class Yoga extends StatefulWidget {
  const Yoga({super.key});

  @override
  State<Yoga> createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return VideoDesign(context: context, index: index);
                    })),
          ],
        ),
      ),
    );
  }
}

class VideoDesign extends StatefulWidget {
  BuildContext context;
  int index;

  VideoDesign({
    Key? key,
    required this.context,
    required this.index,
  }) : super(key: key);

  @override
  _VideoDesignState createState() => _VideoDesignState();
}

class _VideoDesignState extends State<VideoDesign> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    //print(widget.model.postImageUrl+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111");
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/tutorials/yogav${widget.index + 1}.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          "Tutorial ${widget.index}"
              .text
              .textStyle(GoogleFonts.poppins(fontSize: 20))
              .make(),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                            color: Colors.redAccent,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
