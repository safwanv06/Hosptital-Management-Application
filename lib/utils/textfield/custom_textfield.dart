import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.onTap,
      this.onChanged,
      required this.title,
      this.hintText});

  final String title;
  final String? hintText;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: appSizeChart.padding_6.h,
        ),
        TextField(
          style: fontStyles.font16_400,
          decoration: InputDecoration(
              filled: true,
              fillColor: appColors.color000000.withOpacity(0.1),
              hintText: hintText,
              hintStyle: fontStyles.fontHintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: appColors.colorD9D9D9,
                      width: appSizeChart.borderWidth),
                  borderRadius: BorderRadius.circular(appSizeChart.radius_8)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: appColors.colorD9D9D9,
                      width: appSizeChart.borderWidth),
                  borderRadius: BorderRadius.circular(appSizeChart.radius_8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: appColors.colorD9D9D9,
                      width: appSizeChart.borderWidth),
                  borderRadius: BorderRadius.circular(appSizeChart.radius_8)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: appColors.colorD9D9D9,
                      width: appSizeChart.borderWidth),
                  borderRadius: BorderRadius.circular(appSizeChart.radius_8))),
          onTap: onTap,
          controller: controller,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
