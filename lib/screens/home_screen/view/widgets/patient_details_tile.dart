import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/utils/custom_divider/custom_divider.dart';

class PatientDetailsTile extends StatelessWidget {
  const PatientDetailsTile(
      {super.key, required this.patientDetails, required this.index});

  final int index;
  final PatientDetailsModel patientDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appSizeChart.padding_12.h),
      child: Container(
        decoration: BoxDecoration(
          color: appColors.colorF1F1F1,
          borderRadius: BorderRadius.circular(appSizeChart.radius_8),
        ),
        child: Column(
          children: [
            SizedBox(
              height: appSizeChart.padding_20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${index.toString()}.",
                        style: fontStyles.font18_500,
                      ),
                    )),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientDetails.name != null && patientDetails.name != ""
                            ? patientDetails.name!
                            : "Patient not found",
                        style: fontStyles.font18_500,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: appSizeChart.padding_6.h,
                      ),
                      Text(
                        patientDetails.treatments != null
                            ? patientDetails.treatments![0].treatmentName ??
                            "No treatments"
                            : "",
                        style: fontStyles.font16_300Green,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: appSizeChart.padding_14.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: appSizeChart.iconSize16,
                            color: appColors.flushBarErrorColor,
                          ),
                          SizedBox(width: appSizeChart.padding_6.w,),
                          Text(
                            patientDetails.treatmentDate != null
                                ? DateFormat("dd/MM/yyyy")
                                .format(patientDetails.treatmentDate!)
                                : "--/--/----",
                            style: fontStyles.font16_400,
                          ),
                          SizedBox(width: appSizeChart.padding_20.w,),
                          Icon(
                            Icons.person_outline_rounded,
                            size: appSizeChart.iconSize16,
                            color: appColors.flushBarErrorColor,
                          ),
                          SizedBox(width: appSizeChart.padding_6.w,),
                          Text(
                            patientDetails.user != null &&
                                patientDetails.user != ""
                                ? patientDetails.user!
                                : "User not found",
                            overflow: TextOverflow.ellipsis,
                            style: fontStyles.font15_400grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: appSizeChart.padding_10.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: appSizeChart.padding_20.w,)
              ],
            ),
            CustomDivider(),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: appSizeChart.padding_6.h),
              child: Row(
                children: [
                  Expanded(flex: 1,child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Text("View Booking Details",style: fontStyles.font16_400,),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded,size: appSizeChart.iconSize26,color: appColors.buttonColor,),
                        SizedBox(width: appSizeChart.padding_20.w,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
