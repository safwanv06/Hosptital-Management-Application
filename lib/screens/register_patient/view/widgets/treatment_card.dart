import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/model/treatment_model.dart';

import '../../../../main.dart';

class TreatmentCard extends StatelessWidget {
  const TreatmentCard(
      {super.key, required this.treatmentDetails, required this.index});

  final TreatmentModel treatmentDetails;
  final int index;

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
                        treatmentDetails.treatmentName != null &&
                                treatmentDetails.treatmentName != ""
                            ? treatmentDetails.treatmentName!
                            : "Treatment not found",
                        style: fontStyles.font18_500,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: appSizeChart.padding_14.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Male",
                            style: fontStyles.font16_300Green,
                          ),
                          SizedBox(
                            width: appSizeChart.padding_6.w,
                          ),
                          Text(
                            treatmentDetails.maleCount ?? "0",
                            style: fontStyles.font16_400,
                          ),
                          SizedBox(
                            width: appSizeChart.padding_20.w,
                          ),
                          Text(
                            "Female",
                            style: fontStyles.font16_300Green,
                          ),
                          SizedBox(
                            width: appSizeChart.padding_6.w,
                          ),
                          Text(
                            treatmentDetails.femaleCount ?? "0",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
