import 'package:fitness_application/views/lab_test_information/lab_test_list/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/lab_information_repository.dart';

class LabTest extends StatefulWidget {
  @override
  _LabTestState createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
  bool isSearching = false;
  bool isEnabled = true;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching
          ? AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: TextField(
                  autofocus: true,
                  controller: _controller,
                  enabled: isEnabled,
                  style: const TextStyle(fontSize: 16),
                  onChanged: (String query) {},
                  decoration: InputDecoration(
                      hintText: 'Search Lab Test ...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        color: Colors.black,
                        onPressed: () {},
                      ))),
            )
          : AppBar(
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
              leading: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              title: const Text(
                'Search Lab Test',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
      body: Body(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
