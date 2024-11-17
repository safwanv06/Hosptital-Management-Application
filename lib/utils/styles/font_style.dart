import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class FontStyles {
  TextStyle font16Black = GoogleFonts.inter(
      color: appColors.fontColorBlack,
      fontWeight: FontWeight.w400,
      fontSize: appSizeChart.font_16);
  TextStyle font18Black = GoogleFonts.inter(
      color: appColors.fontColorBlack,
      fontWeight: FontWeight.w500,
      fontSize: appSizeChart.font_18);
  TextStyle buttonNameStyle = GoogleFonts.inter(
      color: appColors.fontColorWhite,
      fontWeight: FontWeight.w500,
      fontSize: appSizeChart.font_16);
}
