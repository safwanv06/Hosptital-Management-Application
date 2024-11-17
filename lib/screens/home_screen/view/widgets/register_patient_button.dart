import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';
import '../../../../utils/custom_button/custom_button.dart';
import '../../../register_patient/view/add_patient_view.dart';

class RegisterPatientButton extends StatelessWidget {
  const RegisterPatientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: appSizeChart.padding_20.w),
          child: CustomButton(buttonName: "Register", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddPatientView(),));
          },),
        ),
        SizedBox(height: appSizeChart.padding_12.h,)
      ],
    );
  }
}
