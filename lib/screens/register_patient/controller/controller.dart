import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/treatment_model.dart';
import 'package:noviindus_machine_test/screens/register_patient/service/model/model.dart';
import 'package:noviindus_machine_test/screens/register_patient/service/service.dart';
import 'package:noviindus_machine_test/screens/register_patient/view/widgets/treatment_dialog_count_component.dart';
import 'package:noviindus_machine_test/utils/custom_buttom_sheet/custom_bottom_sheet.dart';
import 'package:noviindus_machine_test/utils/custom_button/custom_button.dart';
import 'package:noviindus_machine_test/utils/custom_divider/custom_divider.dart';
import 'package:noviindus_machine_test/utils/loading_screen/loading_screen.dart';
import 'package:noviindus_machine_test/utils/middleware/api_error_handling.dart';
import 'package:noviindus_machine_test/utils/textfield/custom_textfield.dart';

import '../../../model/branch_details_model.dart';

final paymentOptionController = StateProvider.autoDispose<PaymentOption?>(
  (ref) => null,
);

final treatmentsController = StateProvider.autoDispose<List<TreatmentModel>>(
  (ref) => [],
);

treatmentDialogBox({required BuildContext context, required Function(TreatmentModel model) onUpdate}) {
  TextEditingController controller = TextEditingController();
  int mensCount = 0;
  int femaleCount = 0;
  return showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Center(
          child: Container(
            width: screenUtil.screenWidth - 32,
            padding: EdgeInsets.all(appSizeChart.padding_12.sp),
            decoration: BoxDecoration(
                color: appColors.colorFFFFFF,
                borderRadius: BorderRadius.circular(appSizeChart.radius_8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                    hintText: "Choose preferred treatment",
                    onTap: () async {
                      List<TreatmentModel> treatments = [];
                      loadingScreen(context);
                      await AddPatientService.getTreatments().then(
                        (value) {
                          treatments = value;
                          Navigator.pop(context);
                        },
                      ).onError(
                        (error, stackTrace) {
                          Navigator.pop(context);
                          apiErrorHandling(context: context, error: error);
                        },
                      );
                      await treatmentBottomSheet(
                        context: context,
                        treatments: treatments,
                        onTap: (treatment) {
                          controller.text =
                              treatment.treatmentName ?? "Not Found";
                          Navigator.pop(context);
                        },
                      );
                    },
                    isEnabled: false,
                    controller: controller,
                    title: "Choose treatment"),
                SizedBox(
                  height: appSizeChart.padding_12.h,
                ),
                StatefulBuilder(builder: (context, setState) {
                  return TreatmentDialogCountComponent(
                    count: mensCount.toString(),
                    onAddTap: () {
                      mensCount = mensCount + 1;
                      setState(() {});
                    },
                    onMinusTap: () {
                      mensCount = mensCount - 1;
                      setState(() {});
                    },
                    title: "Men",
                    subTitle: "Add Patients",
                  );
                }),
                StatefulBuilder(
                  builder: (context, setState) => TreatmentDialogCountComponent(
                    count: femaleCount.toString(),
                    onAddTap: () {
                      femaleCount = femaleCount + 1;
                      setState(() {});
                    },
                    onMinusTap: () {
                      femaleCount = femaleCount - 1;
                      setState(() {});
                    },
                    title: "Female",
                    subTitle: "",
                  ),
                ),
                SizedBox(
                  height: appSizeChart.padding_12.h,
                ),
                CustomButton(
                  buttonName: "Save",
                  onTap: () {
                    onUpdate(TreatmentModel(
                        id: 0,
                        treatmentName: controller.text,
                        maleCount: mensCount.toString(),
                        femaleCount: femaleCount.toString()));
                  },
                ),
                SizedBox(
                  height: appSizeChart.padding_12.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

branchBottomSheet(
    {required BuildContext context,
    required List<BranchDetailsModel> branches,
    required Function(BranchDetailsModel branch) onTap}) {
  return customBottomSheet(
      context: context,
      child: Container(
        color: appColors.colorFFFFFF,
        width: screenUtil.screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: branches.map(
            (e) {
              return Padding(
                padding: EdgeInsets.all(appSizeChart.padding_6.sp),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          onTap(e);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.branchName,
                                style: fontStyles.font16_400,
                              ),
                            ),
                          ],
                        )),
                    const CustomDivider()
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ));
}

treatmentBottomSheet(
    {required BuildContext context,
    required List<TreatmentModel> treatments,
    required Function(TreatmentModel treatment) onTap}) {
  return customBottomSheet(
      context: context,
      child: Container(
        color: appColors.colorFFFFFF,
        width: screenUtil.screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: treatments.map(
            (e) {
              return Padding(
                padding: EdgeInsets.all(appSizeChart.padding_6.sp),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          onTap(e);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: screenUtil.screenWidth - 32,
                                child: Text(
                                  e.treatmentName ?? "Not Found",
                                  overflow: TextOverflow.ellipsis,
                                  style: fontStyles.font16_400,
                                ),
                              ),
                            ),
                          ],
                        )),
                    const CustomDivider()
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ));
}

minuteBottomSheet(
    {required BuildContext context, required Function(int minute) onTap}) {
  return customBottomSheet(
      context: context,
      child: Container(
          color: appColors.colorFFFFFF,
          width: screenUtil.screenWidth,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 58,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(appSizeChart.padding_6.sp),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          onTap(index + 1);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (index + 1).toString(),
                                style: fontStyles.font16_400,
                              ),
                            ),
                          ],
                        )),
                    const CustomDivider()
                  ],
                ),
              );
            },
          )));
}

hourBottomSheet(
    {required BuildContext context, required Function(int hour) onTap}) {
  return customBottomSheet(
      context: context,
      child: Container(
          color: appColors.colorFFFFFF,
          width: screenUtil.screenWidth,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 23,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(appSizeChart.padding_6.sp),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          onTap(index + 1);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (index + 1).toString(),
                                style: fontStyles.font16_400,
                              ),
                            ),
                          ],
                        )),
                    const CustomDivider()
                  ],
                ),
              );
            },
          )));
}
