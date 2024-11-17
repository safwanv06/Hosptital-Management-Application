import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../main.dart';

class PdfFontStyles {
  TextStyle font10bold = TextStyle(
      fontSize: pdfSizes.fontSize10,
      color: PdfColor.fromInt(0xFF000000),
      fontWeight: FontWeight.bold);
  TextStyle font13boldGreen = TextStyle(
      fontSize: pdfSizes.fontSize13,
      color: PdfColor.fromInt(0xFF00A64F),
      fontWeight: FontWeight.bold);
  TextStyle font10normalGrey = TextStyle(
      fontSize: pdfSizes.fontSize10,
      color: PdfColor.fromInt(0xFF9A9A9A),
      fontWeight: FontWeight.normal);
  TextStyle font13normalGreen = TextStyle(
      fontSize: pdfSizes.fontSize13,
      color: PdfColor.fromInt(0xFF00A64F),
      fontWeight: FontWeight.normal);
}
