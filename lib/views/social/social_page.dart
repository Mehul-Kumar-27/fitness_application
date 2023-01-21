import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'feeds.dart';
import 'my_posts.dart';

class MySocial extends StatefulWidget {
  const MySocial({super.key});

  @override
  State<MySocial> createState() => _MySocialState();
}

class _MySocialState extends State<MySocial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[300],
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
            bottom: TabBar(
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  text: "Your Posts",
                ),
                Tab(
                  icon: Icon(
                    Icons.list_outlined,
                    color: Colors.white,
                  ),
                  text: "Feeds",
                ),
              ],
              indicatorColor: Colors.blue[200],
              indicatorWeight: 6,
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: TabBarView(children: [MyPosts(), Feeds()]),
          ),
        ),
      ),
    );
  }
}
