import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.onTap});

  final Function() onTap;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding:  EdgeInsets.only(left: appSizeChart.padding_20.w),
        child: InkWell(
            onTap: onTap,
            child: Icon(
              Icons.arrow_back,
              size: appSizeChart.appBarIconSize,
              color: appColors.color000000,
            )),
      ),
      actions: [
        Icon(Icons.notifications_none,size: appSizeChart.appBarIconSize,),
        SizedBox(width: appSizeChart.padding_20.w,)
      ],
    );
  }
}
