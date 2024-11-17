import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';
import '../../../../utils/custom_button/custom_button.dart';
import 'search_box.dart';

class SearchSortFields extends StatelessWidget {
  const SearchSortFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: SizedBox(
                    height: 50.h,
                    child: SearchBox(
                      controller: TextEditingController(),
                      onChanged: (value) {},
                    ))),
            SizedBox(
              width: appSizeChart.padding_16.w,
            ),
            Expanded(
              flex: 1,
              child: CustomButton(
                buttonName: "Search",
                onTap: () {},
              ),
            )
          ],
        ),
        SizedBox(
          height: appSizeChart.padding_24.h,
        ),
        Row(
          children: [
            Text(
              "Sort by :",
              style: fontStyles.font16_400,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: appSizeChart.padding_20.w,
                  vertical: appSizeChart.padding_6.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(appSizeChart.radius_32),
                  border: Border.all(
                      width: appSizeChart.borderWidth,
                      color: appColors.color000000.withOpacity(0.3))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Date",
                    style: fontStyles.font16_400,
                  ),
                  SizedBox(
                    width: appSizeChart.padding_75.w,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: appSizeChart.iconSize20,
                    color: appColors.color389A48,
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
