import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AtHomeWorkOut extends StatefulWidget {
  const AtHomeWorkOut({super.key});

  @override
  State<AtHomeWorkOut> createState() => _AtHomeWorkOutState();
}

class _AtHomeWorkOutState extends State<AtHomeWorkOut> {
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
            "At-home workout routine for men"
                .text
                .textStyle(GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.bold))
                .make()
                .px16(),
            const SizedBox(
              height: 10,
            ),
            ''' Whether you’re a seasoned expert or new to strength training, working out at home is a great option when you can’t get to the gym or need a change of pace.

The at-home workouts below require a limited amount of equipment. Plus, some of the movements can be substituted for bodyweight exercises in which you use your body’s own weight as resistance.

These exercises can serve as a weeklong beginner routine or be cycled to provide several sessions per week for advanced trainees.

If your goal is weight loss, you can add a form of cardio, such as running or cycling, between sessions'''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const SizedBox(
              height: 10,
            ),
            "Equipments Required:"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            const SizedBox(
              height: 10,
            ),
            "flat weight bench, appropriate adjustable dumbbells based on your level of experience"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .overflow(TextOverflow.clip)
                .make(),
            const SizedBox(
              height: 10,
            ),
            "Rest intervals: 60–90 seconds"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
            ),
            "Day 1: Legs, shoulders, and abs"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            const SizedBox(
              height: 10,
            ),
            '''* Legs: dumbbell squats — 3 sets of 6–8 reps
* Shoulders: standing shoulder press — 3 sets of 6–8 reps
* Legs: dumbbell lunge — 2 sets of 8–10 reps per leg
* Shoulders: dumbbell upright rows — 2 sets of 8–10 reps
* Hamstrings: Romanian dumbbell deadlift — 2 sets of 6–8 reps
* Shoulders: lateral raises — 3 sets of 8–10 reps
* Calves: seated calf raises — 4 sets of 10–12 reps
* Abs: crunches with legs elevated — 3 sets of 10–12 reps '''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const Divider(
              thickness: 3,
            ),
            "Day 2: Full body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Back/hamstrings: barbell or trap bar deadlifts — 3 sets of 5 reps
* Back: pullups or lat pulldowns — 3 sets of 6–8 reps
* Chest: barbell or dumbbell incline press — 3 sets of 6–8 reps
* Shoulders: machine shoulder press — 3 sets of 6–8 reps
* Biceps: barbell or dumbbell biceps curls — 3 sets of 8–10 reps
* Shoulders: reverse machine fly — 3 sets of 10–12 reps
* Calves: standing calf raises — 3 sets of 10–12 reps '''
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const Divider(
              thickness: 3,
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
            const SizedBox(
              height: 40,
            ),
           
          ],
        ),
      ).px12(),
    );
  }
}
