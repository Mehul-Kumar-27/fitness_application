import 'package:flutter/services.dart';

class LabInformationAPIClient {
  Future fetchLabInformationFromAssets() async {
    final myData =
        await rootBundle.loadString("assets/Lab_Test_Information.csv");
    List<dynamic> myDataList = myData.split("\n");
    List<List<dynamic>> rowsAsListOfValues = [];
    for (var element in myDataList) {
      List<dynamic> values = [];
      element.split(",").forEach((elementValue) {
        values.add(elementValue);
      });
      
      if (values.length > 2 && values[0] != null && "${values[0]}".isNotEmpty) {
        
        rowsAsListOfValues.add(values);
      }
    }
    rowsAsListOfValues.sort((a, b) {
      return a[0].toLowerCase().compareTo(b[0].toLowerCase());
    });

    return rowsAsListOfValues;
  }
}
