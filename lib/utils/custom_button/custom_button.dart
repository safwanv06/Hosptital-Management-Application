import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onTap,
      this.buttonColor});

  final String buttonName;
  final Function() onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor ?? appColors.buttonColor,
            borderRadius: BorderRadius.circular(appSizeChart.radius_8)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: appSizeChart.padding_12.h),
              child: Center(
                  child: Text(
                buttonName,
                style: fontStyles.fontButtonStyle,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
