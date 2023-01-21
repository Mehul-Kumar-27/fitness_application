// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

import '../auth/bloc/auth_bloc.dart';
import '../auth/bloc/auth_event.dart';
import '../global/global.dart';
import 'BMI/bmi_calculator.dart';
import 'Goals/to_do_list.dart';
import 'lab_test_information/lab_test_list/lab_test.dart';
import 'social/social_page.dart';
import 'yoga/yoga_tutorials.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({super.key});

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white],
            )),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  const AuthEventLogOut(),
                                );
                          },
                          icon: const Icon(Icons.logout))
                    ],
                  ),
                ),
                Material(
                  elevation: 16,
                  shadowColor: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.deepPurpleAccent, Colors.blueAccent],
                        )),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularWidget(
                                label: "Steps Taken",
                                data: "400",
                                icon: const Icon(
                                  Icons.directions_walk_outlined,
                                  size: 40,
                                  color: Colors.black,
                                )),
                          ],
                        ).p(8),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 1,
                            ),
                            CircularWidget(
                              label: "Calories Burned",
                              data: "400",
                              icon: Icon(
                                Icons.whatshot,
                                color: Colors.amber[700],
                                size: 40,
                              ),
                            ).px4(),
                            CircularWidget(
                              label: "Distence walked",
                              data: "400",
                              icon: const Icon(
                                Icons.sports_gymnastics,
                                color: Colors.black,
                                size: 40,
                              ),
                            ).px4(),
                            const SizedBox(
                              width: 1,
                            ),
                          ],
                        ).p(8),
                      ],
                    ),
                  ),
                ).p(7),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
                      },
                      child: statwidget(
                        "Gym",
                        Colors.amber,
                        const Icon(
                          Icons.fitness_center,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ToDoList()));
                      },
                      child: statwidget(
                          "Your Goals",
                          Colors.blueAccent,
                          const Icon(
                            Icons.trending_up,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                  ],
                ).p12(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HealthCheckUp()));
                      },
                      child: statwidget(
                        "BMI",
                        Colors.green[400]!,
                        const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => const MySocial()));
                      },
                      child: statwidget(
                          "Social",
                          Colors.redAccent,
                          const Icon(
                            Icons.handshake,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                  ],
                ).p12(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Yoga()));
                      },
                      child: statwidget(
                        "Yoga",
                        Colors.pinkAccent[200]!,
                        const Icon(
                          Icons.sports_martial_arts,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ).p12(),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LabTest()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.white, Colors.black38],
                        )),
                    child: Center(
                        child: "Lab Test Information"
                            .text
                            .textStyle(GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))
                            .make()),
                  ).px12(),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //////// Overpass Api
  ///////  Todo
  ////// Take Health check Up
  /////  Social Media
  ///// Yoga

  Widget statwidget(String label, Color colorOFWidget, Icon icon) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            color: colorOFWidget, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon],
            ).p12(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label.text
                    .textStyle(GoogleFonts.poppins(fontWeight: FontWeight.bold))
                    .overflow(TextOverflow.clip)
                    .make(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularWidget extends StatefulWidget {
  String label;
  String data;
  Icon icon;
  CircularWidget({
    Key? key,
    required this.label,
    required this.data,
    required this.icon,
  }) : super(key: key);

  @override
  State<CircularWidget> createState() => _CircularWidgetState();
}

class _CircularWidgetState extends State<CircularWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110.0,
          height: 110.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(children: [
            Center(
              child: Container(
                width: 105.0,
                height: 105,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepPurpleAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [widget.icon],
                ),
              ),
            ),
          ]),
        ),
        widget.label.text
            .textStyle(GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold))
            .make()
      ],
    );
  }
}
