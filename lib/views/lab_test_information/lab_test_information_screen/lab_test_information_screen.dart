// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class LabTestInformationScreen extends StatelessWidget {
  List<dynamic> labTest;
  LabTestInformationScreen(
    this.labTest,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lab Test"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        labTest[0],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What are ${labTest[0].replaceAll("Test", "")} Test ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  labTest[2],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What is it used for ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  labTest[3],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What happens during test ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  labTest[4],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton.icon(
                          onPressed: () async {
                            String url = labTest[1].toString();

                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Error Occured",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                          icon: Icon(
                            Icons.public,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Get More Information",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
