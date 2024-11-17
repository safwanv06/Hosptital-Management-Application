import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({super.key, required this.isEnabled, required this.onTap});

  final bool isEnabled;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 22.h,
        width: 22.w,
        decoration: ShapeDecoration(
            color: appColors.colorFFFFFF,
            shape: CircleBorder(
                side: BorderSide(color: appColors.color000000.withOpacity(0.3)))),
        child: Center(
          child: Container(
            height: 16.h,
            width: 16.w,
            decoration: ShapeDecoration(
                color: isEnabled ? appColors.color000000 : null,
                shape: CircleBorder()),
          ),
        ),
      ),
    );
  }
}
