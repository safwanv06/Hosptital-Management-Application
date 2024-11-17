import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/screens/register_patient/controller/controller.dart';
import 'package:noviindus_machine_test/screens/register_patient/view/widgets/treatment_card.dart';
import 'package:noviindus_machine_test/utils/custom_button/custom_button.dart';

import '../../../../main.dart';
import '../../../../model/treatment_model.dart';

class TreatmentCardBuilder extends StatelessWidget {
  const TreatmentCardBuilder({super.key, required this.treatments, required this.onUpdate, required this.onDeleteTap});

  final List<TreatmentModel> treatments;
  final Function(TreatmentModel model) onUpdate;
  final Function(TreatmentModel model) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Treatments",style: fontStyles.font12_300,),
        SizedBox(
          height: appSizeChart.padding_6.h,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: treatments.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return TreatmentCard(
              onDeleteTap: () {
                onDeleteTap(treatments[index]);
              },
              index: index + 1,
              treatmentDetails: treatments[index],
            );
          },
        ),
        SizedBox(
          height: appSizeChart.padding_6.h,
        ),
        CustomButton(
          buttonName: "+ Add Treatment",
          onTap: () {
            treatmentDialogBox(context: context,onUpdate: onUpdate);
          },
        )
      ],
    );
  }
}
