import 'package:flutter/material.dart';

import '../../../../main.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key,required this.controller,required this.onChanged});
final TextEditingController controller;
final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: fontStyles.font16_400,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: appSizeChart.iconSize20,
            color: appColors.color000000.withOpacity(0.5),
          ),
          hintText: "Search for Treatments",
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
      controller: controller,
      onChanged: onChanged,
    );
  }
}
