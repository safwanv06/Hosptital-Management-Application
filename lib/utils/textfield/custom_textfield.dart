import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.onTap,
      this.onChanged,
      this.isEnabled = true,
      required this.title,
      this.inputType,
      this.maxLength,
      this.inputFormatters,
      this.hintText});

  final String title;
  final String? hintText;
  bool isEnabled;
  final Function()? onTap;
  final int? maxLength;
  final Function(String value)? onChanged;
  final TextEditingController controller;
  final TextInputType? inputType;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontStyles.font12_300,
        ),
        SizedBox(
          height: appSizeChart.padding_6.h,
        ),
        InkWell(
          onTap: onTap,
          child: TextField(
            style: fontStyles.font16_400,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: "",
                enabled: isEnabled,
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
                    borderRadius:
                        BorderRadius.circular(appSizeChart.radius_8))),
            keyboardType: inputType,
            onTap: onTap,
            controller: controller,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
