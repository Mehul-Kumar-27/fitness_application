import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Beginner extends StatefulWidget {
  const Beginner({super.key});

  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
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
      body: Container(
        child: ListView(
          children: [
            "Beginner’s workout routine"
                .text
                .textStyle(GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.bold))
                .make(),
            const SizedBox(
              height: 10,
            ),
            '''Starting out in the gym can seem intimidating, but with proper guidance, the process becomes more approachable — and even invigorating.

As a beginner, you can progress very quickly because almost any exercise promotes muscle and strength gains. Still, it’s important to avoid overexertion, which can lead to injuries or decreased performance.

This workout routine has you in the gym 3 days per week (such as Monday, Wednesday, and Friday), with full-body sessions completed each day. This allows you to get used to new movements, focus on proper form, and take time to recover.

You can add reps and sets as needed as you progress. '''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            "Equipments Required:"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            "Fully Equipped Gym"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .overflow(TextOverflow.clip)
                .make(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
            ),
            "Day 1: Full body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Legs: barbell back squats — 3 sets of 5 reps
* Chest: flat barbell bench press — 3 set of 5 reps
* Back: seated cable rows — 3 sets of 6–8 reps
* Shoulders: seated dumbbell shoulder press — 3 sets of 6–8 reps
* Triceps: cable rope triceps pushdowns — 3 sets of 8–10 reps
* Shoulders: lateral raises — 3 sets of 10–12 reps
* Calves: seated calf raises — 3 sets of 10–12 reps
* Abs: planks — 3 sets of 30-second holds '''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            "Day 2: Full body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''Back/hamstrings: barbell or trap bar deadlifts — 3 sets of 5 reps
Back: pullups or lat pulldowns — 3 sets of 6–8 reps
Chest: barbell or dumbbell incline press — 3 sets of 6–8 reps
Shoulders: machine shoulder press — 3 sets of 6–8 reps
Biceps: barbell or dumbbell biceps curls — 3 sets of 8–10 reps
Shoulders: reverse machine fly — 3 sets of 10–12 reps
Calves: standing calf raises — 3 sets of 10–12 reps '''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            "Day 3: Full body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Legs: leg press — 3 sets of 5 reps
* Back: T-bar rows — 3 sets of 6–8 reps
* Chest: machine or dumbbell chest fly — 3 sets of 6–8 reps
* Shoulders: one-arm dumbbell shoulder press — 3 sets of 6–8 reps
* Triceps: dumbbell or machine triceps extensions — 3 sets of 8–10 reps
* Shoulders: cable or dumbbell front raises — 3 sets of 10–12 reps
* Calves: seated calf raises — 3 sets of 10–12 reps
* Abs: decline crunches — 3 sets of 10–12 reps '''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ).p16(),
    );
  }
}
