import 'package:fitness_application/services/lab_information_api.dart';
import 'package:fitness_application/services/lab_information_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../lab_test_information_screen/lab_test_information_screen.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  LabInformation labInformation = LabInformation();

  List<List<dynamic>> testList = [];

  GetTest() async {
    testList = await labInformation.getListOfLabInvestigation();
    setState(() {
      testList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showList(testList);
  }

  @override
  void initState() {
    super.initState();
    GetTest();
  }
}

Widget showList(
  List<List<dynamic>> testList,
) {
  return Scrollbar(
    child: ListView.builder(
      itemCount: testList.length,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return Card(
          elevation: 4.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.grey[50]),
              child: ListTile(
                  title: Text(
                    testList[index][0],
                    maxLines: null,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Source',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LabTestInformationScreen(
                                  testList.elementAt(index))));
                    },
                    child: Text(
                      "Get Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Source',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ))),
        );
      },
    ),
  );
}
