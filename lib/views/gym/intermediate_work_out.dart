import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class IntermediateWorkOut extends StatefulWidget {
  const IntermediateWorkOut({super.key});

  @override
  State<IntermediateWorkOut> createState() => _IntermediateWorkOutState();
}

class _IntermediateWorkOutState extends State<IntermediateWorkOut> {
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
            "Intermediate workout routine"
                .text
                .textStyle(GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.bold))
                .make()
                .px16(),
            const SizedBox(
              height: 10,
            ),
            ''' After working hard in the gym for several months, it’s time to step your training up a notch to keep your gains coming.

At this point, you should have good exercise technique and be able to handle more weight on the bar.

This 4-day-per-week intermediate program increases reps and sets to stimulate new muscle growth. When they become too easy, you can gradually add more weight or more reps/sets.

If you do it correctly, you can follow this routine for several years until you reach an advanced level. It may be helpful to switch up your exercises on occasion to keep yourself engaged and prevent burnout.'''
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
            "Rest intervals: "
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            "90–180 seconds for main movements, 60–90 seconds for accessories"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 15, color: Colors.grey[600]))
                .make(),
            const SizedBox(
              height: 10,
            ),
            "Intensity: "
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            "Select a weight that allows you to complete the prescribed reps while leaving about 2 solid reps in the tank. To increase intensity, go to your limit on the last set."
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
            "Day 1: Upper body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Chest: flat barbell bench press — 4 sets of 6–8 reps
 *Back: bent-over barbell rows — 3 sets of 6–8 reps
* Shoulders: seated dumbbell press — 3 sets of 8–10 reps
* Chest/triceps: dips — 3 sets of 8–10 reps
* Back: pullups or lat pulldowns — 3 sets of 8–10 reps
* Triceps/chest: lying dumbbell triceps extensions — 3 sets of 10–12 reps
* Biceps: incline dumbbell curls — 3 sets of 10–12 reps '''
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
            "Day 2: Lower body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Legs: barbell back squats — 4 sets of 6–8 reps
* Legs: leg press — 3 sets of 8–10 reps
* Quadriceps: seated leg extensions — 3 sets of 10-12 reps
* Quadriceps: dumbbell or barbell walking lunges — 3 sets of 10–12 reps (no videos)
* Calves: calf press on leg press — 4 sets of 12–15 reps
* Abs: decline crunches — 4 sets of 12–15 reps '''
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
            "Day 3: Upper body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Shoulders: overhead press — 4 sets of 6–8 reps
* Chest: incline dumbbell bench press — 3 sets of 8–10 reps
* Back: one-arm cable rows — 3 sets of 10–12 reps
* Shoulders: cable lateral raises — 3 sets of 10–12 reps
* Rear deltoids/traps: face pulls — 3 sets of 10–12 reps
* Traps: dumbbell shrugs — 3 sets of 10–12 reps
* Triceps: seated overhead triceps extensions — 3 sets of 10–12 reps
* Biceps: machine preacher curls — 3 sets of 12–15 reps '''
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
            "Day 4: Lower body"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Back/hamstrings: barbell deadlift — 4 sets of 6 reps
* Glutes: barbell hip thrusts — 3 sets of 8-10 reps
* Hamstrings: Romanian dumbbell deadlifts — 3 sets of 10–12 reps
* Hamstrings: lying leg curls — 3 sets of 10-12 reps
* Calves: seated calf raises — 4 sets of 12–15 reps
* Abs: leg raises on Roman chair — 4 sets of 12–15 reps '''
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
      ).px16(),
    );
  }
}
