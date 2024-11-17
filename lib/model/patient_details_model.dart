import 'package:noviindus_machine_test/model/branch_details_model.dart';
import 'package:noviindus_machine_test/model/treatment_model.dart';

class PatientDetailsModel {
  PatientDetailsModel({
    required this.id,
    required this.name,
    required this.user,
    required this.whatsAppNumber,
    required this.address,
    required this.treatments,
     this.branchDetailsModel,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.treatmentDate,
  });

  int? id;
  String? name;
  String? user;
  String? whatsAppNumber;
  String? address;
  List<TreatmentModel>? treatments;
  BranchDetailsModel? branchDetailsModel;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  DateTime? treatmentDate;
}
