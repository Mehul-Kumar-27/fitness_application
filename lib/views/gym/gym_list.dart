import 'package:fitness_application/views/gym/advanced.dart';
import 'package:fitness_application/views/gym/at_home_work_out.dart';
import 'package:fitness_application/views/gym/beginner_level.dart';
import 'package:fitness_application/views/gym/intermediate_work_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class GymList extends StatefulWidget {
  const GymList({super.key});

  @override
  State<GymList> createState() => _GymListState();
}

class _GymListState extends State<GymList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Column(
        children: [
          Row(
            children: [
              "Let's Plan Workout for you !"
                  .text
                  .textStyle(GoogleFonts.openSans(fontSize: 20))
                  .color(Colors.grey[800])
                  .make()
                  .p16()
            ],
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AtHomeWorkOut()));
              },
              child: workOutWidget("At-home workout routine for men")),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Beginner()));
              },
              child: workOutWidget('''Beginner’s workout routine for men''')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntermediateWorkOut()));
              },
              child: workOutWidget("Intermediate workout routine for men")),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdvancedWorkOut()));
              },
              child: workOutWidget("Advanced workout routine for men")),
        ],
      ),
    );
  }

  Widget workOutWidget(String heading) {
    return SizedBox(
      height: 60,
      child: Card(
        child: Row(
          children: [
            const Icon(
              Icons.menu,
              color: Colors.blue,
            ).px8(),
            const SizedBox(
              width: 20,
            ),
            heading.text.textStyle(GoogleFonts.poppins(fontSize: 17)).make()
          ],
        ),
      ),
    );
  }
}
