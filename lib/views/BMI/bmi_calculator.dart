import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';

class HealthCheckUp extends StatefulWidget {
  const HealthCheckUp({super.key});

  @override
  State<HealthCheckUp> createState() => _HealthCheckUpState();
}

class _HealthCheckUpState extends State<HealthCheckUp> {
  late final TextEditingController _weight = TextEditingController();
  late final TextEditingController _height = TextEditingController();
  late double bmi;
  bool calculatedBmi = false;
  late Color resultColor;
  late int result;

  @override
  void dispose() {
    _weight.dispose();
    _height.dispose();
    super.dispose();
  }

  double bmiCalculation() {
    double weight = double.parse(_weight.text);
    double height =
        (double.parse(_height.text) / 100) * (double.parse(_height.text) / 100);

    setState(() {
      bmi = weight / height;
      if (bmi < 18.5) {
        resultColor = Colors.deepPurpleAccent;
        result = 1;
      } else if (bmi >= 18.5 && bmi < 24.9) {
        resultColor = Colors.greenAccent;
        result = 2;
      } else {
        resultColor = Colors.redAccent;
        result = 3;
      }
      calculatedBmi = true;
    });

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: "What is BMI ?"
              .text
              .textStyle(GoogleFonts.poppins(
                fontSize: 30,
              ))
              .color(Colors.black)
              .make(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.deepPurpleAccent[100]!, Colors.blueAccent[200]!],
            )),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Material(
                elevation: 5,
                child:
                    '''Body Mass Index (BMI) is a person’s weight in kilograms (or pounds) divided by the square of height in meters (or feet). A high BMI can indicate high body fatness. BMI screens for weight categories that may lead to health problems, but it does not diagnose the body fatness or health of an individual.'''
                        .text
                        .overflow(TextOverflow.clip)
                        .textStyle(GoogleFonts.openSans(fontSize: 17))
                        .make()
                        .p12(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            calculatedBmi
                ? Column(
                    children: [
                      Container(
                        child: Lottie.asset(
                            "assets/animations/healthy-animation.json"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      "Your BMI is : $bmi"
                          .text
                          .textStyle(GoogleFonts.poppins(
                            fontSize: 20,
                          ))
                          .make(),
                      result == 1
                          ? "Your are underweight !!!"
                              .text
                              .textStyle(GoogleFonts.poppins(
                                  fontSize: 20, color: resultColor))
                              .make()
                          : result == 2
                              ? "Perfect !! , your healthy"
                                  .text
                                  .textStyle(GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: resultColor,
                                  ))
                                  .make()
                              : "Your are over weight"
                                  .text
                                  .textStyle(GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: resultColor,
                                  ))
                                  .make()
                    ],
                  )
                : Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Let's calculate BMI"
                            .text
                            .textStyle(GoogleFonts.poppins(fontSize: 30))
                            .make()
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Material(
                      elevation: 30,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.deepPurpleAccent[100]!,
                                Colors.blueAccent[200]!
                              ],
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "Enter Your Weight in Kg's"
                                    .text
                                    .textStyle(
                                        GoogleFonts.poppins(fontSize: 17))
                                    .overflow(TextOverflow.clip)
                                    .make(),
                              ],
                            ).px16().py2(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _weight,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                  hintText: 'Weight in kg',
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                "Enter Your Height in Centimeter's"
                                    .text
                                    .textStyle(
                                        GoogleFonts.poppins(fontSize: 17))
                                    .overflow(TextOverflow.clip)
                                    .make(),
                              ],
                            ).px16().py2(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                controller: _height,
                                enableSuggestions: false,
                                keyboardType: TextInputType.number,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                  hintText: 'Height',
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_weight.text.isEmpty ||
                                      _height.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please fill all fields !")));
                                  } else {
                                    bmiCalculation();
                                  }
                                },
                                child: const Text("Calculate BMI"))
                          ],
                        ),
                      ),
                    ),
                  ]),
          ],
        ),
      ),
    );
  }
}
