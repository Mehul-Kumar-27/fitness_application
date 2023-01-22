// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:fitness_application/views/gym/gym_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

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
  String today = DateFormat.yMMMMd("en_US").format(DateTime.now());

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  askPermission() async {
    PermissionStatus activity = await Permission.activityRecognition.request();
    if (activity == PermissionStatus.granted) {
      initPlatformState();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please grat permission")));
    }
  }

  @override
  void initState() {
    super.initState();

    askPermission();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

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
                          icon: const Icon(Icons.logout)),
                      const SizedBox(
                        width: 10,
                      ),
                      today.text
                          .textStyle(GoogleFonts.poppins(
                              fontSize: 20, color: Colors.black))
                          .bold
                          .make(),
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
                                data: _steps,
                                icon:
                                    "assets/animations/walking-shapes-animation.json"),
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
                              data: "210",
                              icon: "assets/animations/fire.json",
                            ).px4(),
                            CircularWidget(
                              label: "Distence walked",
                              data: "1.29 Km",
                              icon: "assets/animations/distance.json",
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GymList()));
                      },
                      child: statwidget(
                          "Gym", Colors.amber, "assets/animations/gym.json"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ToDoList()));
                      },
                      child: statwidget("Your Goals", Colors.blueAccent,
                          "assets/animations/goals.json"),
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
                        "assets/animations/healthy-animation.json",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => const MySocial()));
                      },
                      child: statwidget("Social", Colors.redAccent,
                          "assets/animations/social.json"),
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
                        "assets/animations/yoga.json",
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
                  child: Card(
                    elevation: 20,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.local_hospital,
                          color: Colors.indigoAccent,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        "Lab Test Information"
                            .text
                            .textStyle(GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))
                            .make(),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
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

  Widget statwidget(String label, Color colorOFWidget, String icon) {
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
              children: [
                Container(
                    height: 60, width: 60, child: LottieBuilder.asset(icon))
              ],
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
  String icon;
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
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 60, child: LottieBuilder.asset(widget.icon))
                    ],
                  ),
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
            .make(),
        widget.data.text
            .textStyle(GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold))
            .make()
      ],
    );
  }
}
