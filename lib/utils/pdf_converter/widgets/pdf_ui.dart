import 'package:intl/intl.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/screens/home_screen/view/widgets/patient_details_tile.dart';
import 'package:pdf/widgets.dart';

Widget pdfHeader({required PatientDetailsModel patientDetails, required logo}) {
  return Column(children: [
    Row(children: [
      Image(MemoryImage(logo), width: 76, height: 80),
      Spacer(),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text("KUMARAKOM", style: pdfFontStyles.font10bold),
        SizedBox(height: pdfSizes.padding8),
        Text("Cheepungal P.O Kumarakom, kottayam, Kerala - 686563",
            style: pdfFontStyles.font10normalGrey),
        SizedBox(height: pdfSizes.padding8),
        Text("e-mail: unknown@gmail.com",
            style: pdfFontStyles.font10normalGrey),
        SizedBox(height: pdfSizes.padding8),
        Text("Mob: +91 9876543210 | +91 9786543210",
            style: pdfFontStyles.font10normalGrey),
        SizedBox(height: pdfSizes.padding8),
        Text("GST No: 32AABCU9603R1ZW", style: pdfFontStyles.font10normalGrey),
      ])
    ]),
    SizedBox(height: pdfSizes.padding18),
    Divider(color: pdfColors.colorCBCBCB)
  ]);
}

Widget pdfBody(
    {required PatientDetailsModel patientDetails,
    required logo,
    required watermark}) {
  return Stack(children: [
    Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(top: pdfSizes.padding18),
            child: Image(
              MemoryImage(watermark),
            ))),
    Column(children: [
      Text("Patient Details", style: pdfFontStyles.font13normalGreen),
      SizedBox(height: pdfSizes.padding18),
      Row(children: [
        SizedBox(
          width: 218,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Name", style: pdfFontStyles.font10bold),
              Text(patientDetails.name ?? "Name not found",
                  style: pdfFontStyles.font10normalGrey),
            ]),
            SizedBox(height: pdfSizes.padding8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Address", style: pdfFontStyles.font10bold),
              Text(patientDetails.address ?? "------",
                  style: pdfFontStyles.font10normalGrey),
            ]),
            SizedBox(height: pdfSizes.padding8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("WhatsApp number", style: pdfFontStyles.font10bold),
              Text(patientDetails.whatsAppNumber ?? "--------",
                  style: pdfFontStyles.font10normalGrey),
            ]),
            SizedBox(height: pdfSizes.padding8),
          ]),
        ),
        SizedBox(width: pdfSizes.padding40),
        SizedBox(
          width: 218,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Booked On", style: pdfFontStyles.font10bold),
              Text(
                  patientDetails.treatmentDate != null
                      ? DateFormat("dd/MM/yyyy")
                          .format(patientDetails.treatmentDate!)
                      : "--/--/---- | ${patientDetails.treatmentDate != null ? DateFormat("dd/MM/yyyy").format(patientDetails.treatmentDate!) : "--/--/----"}",
                  style: pdfFontStyles.font10normalGrey),
            ]),
            SizedBox(height: pdfSizes.padding8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Treatment Date", style: pdfFontStyles.font10bold),
              Text(
                  patientDetails.treatmentDate != null
                      ? DateFormat("dd/MM/yyyy")
                          .format(patientDetails.treatmentDate!)
                      : "--/--/----",
                  style: pdfFontStyles.font10normalGrey),
            ]),
            SizedBox(height: pdfSizes.padding8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Treatment time", style: pdfFontStyles.font10bold),
              Text(
                  patientDetails.treatmentDate != null
                      ? DateFormat("dd/MM/yyyy")
                          .format(patientDetails.treatmentDate!)
                      : "--/--/----",
                  style: pdfFontStyles.font10normalGrey),
            ]),
            SizedBox(height: pdfSizes.padding8),
          ]),
        )
      ]),
      SizedBox(height: pdfSizes.padding18),
      Divider(color: pdfColors.colorCBCBCB),
      pdfTable(patientDetails: patientDetails),
      Divider(color: pdfColors.colorCBCBCB),
      amountTotalWidget(patientDetails: patientDetails)
    ])
  ]);
}

Widget pdfTable({required PatientDetailsModel patientDetails}) {
  List headers = ["Treatment", "Prize", "Male", "Female", "Total"];
  List<List> data = patientDetails.treatments?.map(
        (e) {
          return [
            e.treatmentName,
            e.prize,
            e.maleCount,
            e.femaleCount,
            ((e.prize != null ? int.parse(e.prize!) : 0) *
                ((e.maleCount != null ? int.parse(e.maleCount!) : 0) +
                    (e.femaleCount != null ? int.parse(e.femaleCount!) : 0)))
          ];
        },
      ).toList() ??
      [[]];
  return TableHelper.fromTextArray(
      data: data,
      headers: headers,
      border: null,
      headerStyle: pdfFontStyles.font13boldGreen,
      cellAlignment: Alignment.centerLeft);
}

Widget amountTotalWidget({required PatientDetailsModel patientDetails}) {
  return Column(children: [
    SizedBox(height: pdfSizes.padding8),
    tableRowComponent(
        isBoldText: true,
        title: "Total Amount",
        value: patientDetails.totalAmount != null
            ? patientDetails.totalAmount.toString()
            : ""),
    SizedBox(height: pdfSizes.padding8),
    tableRowComponent(
        isBoldText: false,
        title: "Discount",
        value: patientDetails.totalAmount != null
            ? patientDetails.totalAmount.toString()
            : "0"),
    SizedBox(height: pdfSizes.padding8),
    tableRowComponent(
      isBoldText: false,
      title: "Advance",
      value: patientDetails.advanceAmount != null
          ? patientDetails.advanceAmount.toString()
          : "0",
    ),
    SizedBox(height: pdfSizes.padding8),
    Divider(color: pdfColors.colorCBCBCB),
    SizedBox(height: pdfSizes.padding8),
    tableRowComponent(
      isBoldText: true,
      title: "Balance",
      value: patientDetails.balanceAmount != null
          ? patientDetails.balanceAmount.toString()
          : "0",
    ),
  ]);
}

Widget tableRowComponent(
    {required String title, required String value, required bool isBoldText}) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    Expanded(
        flex: 8,
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(title,
                style: isBoldText
                    ? pdfFontStyles.font10bold
                    : pdfFontStyles.font10normalGrey))),
    Expanded(
        flex: 2,
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(value,
                style: isBoldText
                    ? pdfFontStyles.font10bold
                    : pdfFontStyles.font10normalGrey)))
  ]);
}
