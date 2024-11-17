import 'package:flutter/material.dart';

import '../../main.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: appColors.color000000.withOpacity(0.2),
      height: appSizeChart.borderWidth,
    );
  }
}
