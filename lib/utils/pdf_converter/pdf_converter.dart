import 'dart:io';

import 'package:flutter/services.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/utils/pdf_converter/widgets/pdf_ui.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

import '../../main.dart';

Future pdfConverter({required PatientDetailsModel patientDetails}) async {
  final logoImage =
      (await rootBundle.load(imageData.appLogo)).buffer.asUint8List();
  final watermarkImage =
      (await rootBundle.load(imageData.pdfWaterMark)).buffer.asUint8List();
  Document pdf = Document();
  pdf.addPage(MultiPage(
    build: (context) {
      return [
        pdfHeader(patientDetails: patientDetails, logo: logoImage),
        pdfBody(
            patientDetails: patientDetails,
            logo: logoImage,
            watermark: watermarkImage),
      ];
    },
  ));
  return pdf;
}

Future savePdf({required String name, required Document pdf}) async {
  final path = await getExternalStorageDirectory();
  final file = File("${path!.path}/$name");
  await file.writeAsBytes(await pdf.save());
  return file;
}

Future openPdfFile({required File file}) async {
  final path = file.path;
  await OpenFile.open(path);
}
