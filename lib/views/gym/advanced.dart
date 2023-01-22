import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AdvancedWorkOut extends StatefulWidget {
  const AdvancedWorkOut({super.key});

  @override
  State<AdvancedWorkOut> createState() => _AdvancedWorkOutState();
}

class _AdvancedWorkOutState extends State<AdvancedWorkOut> {
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
            "Advanced workout routine"
                .text
                .textStyle(GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.bold))
                .make(),
            const SizedBox(
              height: 10,
            ),
            '''Additional volume (sets and reps) and intensity (weight on the bar) are essential for advanced gym-goers to keep gaining muscle. Keep in mind that you should not attempt this routine unless you’ve been training consistently for 2 or more years.

While the muscle gains won’t come as fast as they did when you were a beginner, there’s still room for significant progress at this stage.

This grueling workout routine has you in the gym 6 days per week with 1 rest day in between. It follows a pull-push-legs pattern, hitting each muscle group twice per week, with supersets incorporated for maximum hypertrophy (muscle growth).'''
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
            "Rest periods:"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            "90–180 seconds for main movements, 60–90 seconds for accessories"
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
            "Intensity: "
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            "Select a weight that allows you to complete the prescribed reps while leaving about 2 solid reps in the tank. To increase intensity, go to failure on the last set."
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
            "Supersets: "
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            "Complete the initial set of the first movement immediately followed by the second movement. Repeat until all designated reps and sets are complete."
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
            "Pull A"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Back/hamstrings: barbell deadlift — 5 sets of 5 reps
* Back: pullups or lat pulldowns — 3 sets of 10–12 reps
* Back: T-bar rows or seated cable rows — 3 sets of 10–12 reps
* Rear deltoids/traps: face pulls — 4 sets of 12–15 reps
* Biceps: hammer curls — 4 sets of 10-12 reps supersetted with dumbbell shrugs 4 sets of 10–12 reps
* Biceps: standing cable curls — 4 sets of 10–12 reps '''
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
            "Push A"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Chest: flat barbell bench press — 5 set of 5 reps
* Shoulders: seated dumbbell press — 3 sets of 6–8 reps
* Chest: incline dumbbell bench press — 3 sets of 10–12 reps
* Triceps/shoulders: triceps pushdowns — 4 sets of 10–12 reps supersetted with lateral raises — 4 sets of 10–12 reps
* Chest: cable crossovers — 4 sets of 10–12 reps '''
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
            "Legs A"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Legs: barbell back squats — 5 sets of 5 reps
* Hamstrings: Romanian dumbbell deadlifts — 3 sets of 6–8 reps
* Legs: leg press — 3 sets of 8–10 reps
* Hamstrings: lying leg curls — 4 sets of 10–12 reps
* Calves: seated calf raises — 4 sets of 12–15 reps
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
            "Pull B"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Back: bent-over barbell rows — 3 sets of 6–8 reps
* Back: pull-ups (weighted if needed) — 3 sets of 8–10 reps
* Back: one-arm rows — 3 sets of 8–10 reps
* Lower back: hyperextensions — 4 sets of 10–12 reps supersetted with machine preacher curls — 4 sets of 10–12 reps
* Traps: barbell shrugs — 4 sets of 10–12 reps
* Biceps: standing dumbbell curls — 4 sets of 10–12 reps '''
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
            "Push B"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''* Shoulders: overhead press — 5 sets of 5 reps
* Chest: dumbbell bench press (incline or flat) — 3 sets of 8–10 reps
* Chest/triceps: dips (weighted if needed) — 4 sets of 10–12 reps
* Shoulders: single-arm cable lateral raises — 4 sets of 10–12 reps
* Chest: machine fly — 4 sets of 10–12 reps
* Triceps: overhead extensions with rope — 4 sets of 10–12 reps'''
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
            "Legs B"
                .text
                .textStyle(
                    GoogleFonts.poppins(fontSize: 20, color: Colors.black))
                .make(),
            '''Legs: barbell front squats — 5 sets of 5 reps
Hamstrings: glute ham raises — 3 sets of 8–10 reps
Legs: walking dumbbell lunges — 3 sets of 10–12 reps per leg
Quadriceps: seated leg extensions — 4 sets of 10–12 reps supersetted with standing calf raises — 4 sets of 12–15 reps
Abs: hanging leg raises — 4 sets of 12–15 reps'''
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
