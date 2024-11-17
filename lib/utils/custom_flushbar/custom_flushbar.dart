import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/utils/custom_flushbar/model/flushbar_type.dart';

flushBarNotification(
    {required BuildContext context,
    required String message,
    required FlushBarType type}) {
  late Color backGroundColor;
  Color messageColor = appColors.colorFFFFFF;

  switch (type) {
    case FlushBarType.success:
      backGroundColor = appColors.flushBarSuccessColor;
    case FlushBarType.warning:
      backGroundColor = appColors.flushBarWarningColor;
    case FlushBarType.error:
      backGroundColor = appColors.flushBarErrorColor;
  }
  Flushbar(
    borderRadius: BorderRadius.circular(appSizeChart.radius_8),
    backgroundColor: backGroundColor,
    padding: EdgeInsets.symmetric(
        horizontal: appSizeChart.padding_16.w,
        vertical: appSizeChart.padding_12.h),
    margin: EdgeInsets.symmetric(horizontal: appSizeChart.padding_24.sp),
    messageText: Row(
      children: [
        Icon(
          Icons.info_outline,
          size: 20.sp,
          color: messageColor,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            message,
            softWrap: true,
            style: TextStyle(
              color: messageColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}
