import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/screens/home_screen/view/widgets/patient_details_tile.dart';

import '../../../../model/patient_details_model.dart';

class PatientListBuilder extends StatelessWidget {
  const PatientListBuilder({super.key, required this.patients});

  final List<PatientDetailsModel> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patients.length,
      padding: EdgeInsets.symmetric(horizontal: appSizeChart.padding_20.w),
      itemBuilder: (context, index) {
        return PatientDetailsTile(
          patientDetails: patients[index],
          index: index + 1,
        );
      },
    );
  }
}
