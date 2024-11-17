import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/branch_details_model.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/model/treatment_model.dart';
import 'package:noviindus_machine_test/utils/middleware/dio_middleware.dart';

class HomeScreenService {
  static Future<List<PatientDetailsModel>> getPatientList() async {
    try {
      Response response = await dioApiCall().get(apiRoutes.patientList);
      if (response.statusCode == 200 && response.data["status"] != false) {
        List data = response.data["patient"];
        List<PatientDetailsModel> patients = [];
        for (Map element in data) {
          List treatmentData = element["patientdetails_set"];
          List<TreatmentModel> treatments = [];
          for (Map element in treatmentData) {
            treatments.add(TreatmentModel(
                id: element["id"],
                treatmentName: element["treatment_name"],
                maleCount: element["male"],
                femaleCount: element["female"]));
          }
          patients.add(PatientDetailsModel(
              id: element["id"],
              name: element["name"],
              user: element["user"],
              whatsAppNumber: element["phone"],
              address: element["address"],
              treatments: treatments,
              branchDetailsModel: element["branch"] != null
                  ? BranchDetailsModel(
                      id: element["branch"]["id"],
                      location: element["branch"]["location"],
                      branchName: element["branch"]["name"])
                  : null,
              totalAmount: element["total_amount"],
              discountAmount: element["discount_amount"],
              advanceAmount: element["advance_amount"],
              balanceAmount: element["balance_amount"],
              treatmentDate: element["date_nd_time"] != null
                  ? DateTime.parse(element["date_nd_time"])
                  : null));
        }
        return patients;
      } else {
        throw DioException(
            requestOptions: RequestOptions(), response: response);
      }
    } catch (e) {
      print("the error is $e");
      rethrow;
    }
  }
}
