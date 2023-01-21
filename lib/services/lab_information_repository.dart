import 'lab_information_api.dart';

class LabInformation {
  Future getListOfLabInvestigation() async {
    LabInformationAPIClient labInformationAPIClient =
        LabInformationAPIClient();

    return labInformationAPIClient.fetchLabInformationFromAssets();
  }
}
