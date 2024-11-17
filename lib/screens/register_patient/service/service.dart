import 'package:dio/dio.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/branch_details_model.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/model/treatment_model.dart';
import 'package:noviindus_machine_test/utils/middleware/dio_middleware.dart';

class AddPatientService {
  static Future addPatient({required PatientDetailsModel patientDetails}) async {
    try{}
        catch(e){
      rethrow;
        }
  }

  static Future getBranches() async {
    try {
      Response response = await dioApiCall().get(apiRoutes.branchList);
      if (response.statusCode == 200 && response.data["status"] == true) {
        List data = response.data["branches"];
        List<BranchDetailsModel> branches = [];
        for (Map element in data) {
          branches.add(BranchDetailsModel(
              id: element["id"],
              location: element["location"],
              branchName: element["name"]));
        }
        return branches;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getTreatments() async {
    try {
      Response response = await dioApiCall().get(apiRoutes.treatmentList);
      if (response.statusCode == 200 && response.data["status"] == true) {
        List data = response.data["treatments"];
        List<TreatmentModel> treatments = [];
        for (Map element in data) {
          treatments.add(TreatmentModel(
              id: element["id"],
              treatmentName: element["name"],
              femaleCount: null,maleCount: null));
        }
        return treatments;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
