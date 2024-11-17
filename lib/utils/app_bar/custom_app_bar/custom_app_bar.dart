import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(screenUtil.screenWidth, 70.h),
        child: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: appColors.color000000,
          ),
          title: Text(
            title,
          ),
        ));
  }
}
