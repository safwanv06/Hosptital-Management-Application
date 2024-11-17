import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class FontStyles {
  TextStyle font15_400grey = GoogleFonts.inter(
      color: appColors.color000000.withOpacity(0.5),
      fontWeight: FontWeight.w400,
      fontSize: appSizeChart.font_16);

  TextStyle font16_400 = GoogleFonts.inter(
      color: appColors.color404040,
      fontWeight: FontWeight.w400,
      fontSize: appSizeChart.font_16);

  TextStyle font12_300 = GoogleFonts.inter(
      color: appColors.color000000,
      fontWeight: FontWeight.w300,
      fontSize: appSizeChart.font_12);

  TextStyle font12_500Blue = GoogleFonts.inter(
      color: appColors.color0028FC,
      fontWeight: FontWeight.w500,
      fontSize: appSizeChart.font_12);

  TextStyle font24_600 = GoogleFonts.inter(
      color: appColors.color404040,
      fontWeight: FontWeight.w600,
      fontSize: appSizeChart.font_24);

  TextStyle font18_500 = GoogleFonts.inter(
      color: appColors.color000000,
      fontWeight: FontWeight.w500,
      fontSize: appSizeChart.font_18);

  TextStyle font16_300Green = GoogleFonts.inter(
      color: appColors.buttonColor,
      fontWeight: FontWeight.w300,
      fontSize: appSizeChart.font_16);

  TextStyle fontHintText = GoogleFonts.inter(
      color: appColors.color000000.withOpacity(0.4),
      fontWeight: FontWeight.w300,
      fontSize: appSizeChart.font_14);

  TextStyle fontButtonStyle = GoogleFonts.inter(
      color: appColors.colorFFFFFF,
      fontWeight: FontWeight.w600,
      fontSize: appSizeChart.font_16);
}
