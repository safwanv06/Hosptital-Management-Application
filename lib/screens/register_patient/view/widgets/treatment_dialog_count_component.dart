import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';

import '../../../../utils/textfield/custom_textfield.dart';

class TreatmentDialogCountComponent extends StatelessWidget {
  const TreatmentDialogCountComponent(
      {super.key,
      required this.count,
      required this.onAddTap,
      required this.onMinusTap, required this.title, required this.subTitle});

  final String count;
  final Function() onAddTap;
  final Function() onMinusTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: CustomTextField(
                controller: TextEditingController(text: title),
                title: subTitle)),
        SizedBox(
          width: appSizeChart.padding_35.w,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: appSizeChart.padding_20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: onMinusTap,
                child: Container(
                  width: appSizeChart.iconSize40,
                  height: appSizeChart.iconSize40,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: appColors.buttonColor),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      color: appColors.colorFFFFFF,
                      size: appSizeChart.iconSize16,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(appSizeChart.radius_8),
                    border: Border.all(
                        color: appColors.color000000.withOpacity(0.5))),
                child: Center(
                  child: Text(
                    count,
                    style: fontStyles.font16_400,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: onAddTap,
                child: Container(
                  width: appSizeChart.iconSize40,
                  height: appSizeChart.iconSize40,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: appColors.buttonColor),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: appColors.colorFFFFFF,
                      size: appSizeChart.iconSize16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
