import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/branch_details_model.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/model/treatment_model.dart';
import 'package:noviindus_machine_test/screens/register_patient/service/model/model.dart';
import 'package:noviindus_machine_test/screens/register_patient/service/service.dart';
import 'package:noviindus_machine_test/screens/register_patient/view/widgets/payment_option_widget.dart';
import 'package:noviindus_machine_test/screens/register_patient/view/widgets/treatment_card_builder.dart';
import 'package:noviindus_machine_test/utils/app_bar/main_app_bar/main_app_bar.dart';
import 'package:noviindus_machine_test/utils/custom_button/custom_button.dart';
import 'package:noviindus_machine_test/utils/loading_screen/loading_screen.dart';
import 'package:noviindus_machine_test/utils/middleware/api_error_handling.dart';
import 'package:noviindus_machine_test/utils/pdf_converter/pdf_converter.dart';
import 'package:noviindus_machine_test/utils/textfield/custom_textfield.dart';
import 'package:pdf/widgets.dart' as pw;

import '../controller/controller.dart';

class AddPatientView extends ConsumerWidget {
  AddPatientView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController advanceController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController treatmentDateController = TextEditingController();
  final TextEditingController treatmentTimeHourController =
      TextEditingController();
  final TextEditingController treatmentTimeMinuteController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PaymentOption? paymentOption = ref.watch(paymentOptionController);
    List<TreatmentModel> treatments = ref.watch(treatmentsController);
    print("the treatments ${treatments.length}");
    return Scaffold(
      appBar: MainAppBar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(appSizeChart.padding_20.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: nameController,
                title: "Name",
                hintText: "Enter your full name",
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                controller: whatsappNumberController,
                title: "Whatsapp Number",
                hintText: "Enter your whatsapp number",
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                controller: addressController,
                title: "Address",
                hintText: "Enter your full address",
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                controller: branchController,
                title: "Branch",
                hintText: "Select the branch",
                isEnabled: false,
                onTap: () async {
                  loadingScreen(context);
                  List<BranchDetailsModel> branches = [];
                  await AddPatientService.getBranches().onError(
                    (error, stackTrace) {
                      Navigator.pop(context);
                      apiErrorHandling(context: context, error: error);
                    },
                  ).then(
                    (value) {
                      branches = value;
                      Navigator.pop(context);
                    },
                  );
                  branchBottomSheet(
                    context: context,
                    branches: branches,
                    onTap: (branch) {
                      branchController.text = branch.branchName;
                      locationController.text = branch.location;
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                controller: locationController,
                title: "Location",
                hintText: "Choose your location",
                isEnabled: false,
                onTap: () {},
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              StatefulBuilder(builder: (context, setState) {
                return TreatmentCardBuilder(
                  treatments: treatments,
                  onUpdate: (model) {
                    treatments.add(model);
                    ref.read(treatmentsController.notifier).state = treatments;
                    Navigator.pop(context);
                    setState(() {});
                  },
                );
              }),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  inputType: TextInputType.number,
                  controller: totalController,
                  title: "Total Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  inputType: TextInputType.number,
                  controller: discountController,
                  title: "Discount Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              PaymentOptionWidget(
                paymentOption: paymentOption,
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  inputType: TextInputType.number,
                  controller: advanceController,
                  title: "Advance Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  inputType: TextInputType.number,
                  controller: balanceController,
                  title: "Balance Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  isEnabled: false,
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        context: context);
                    if (date != null) {
                      treatmentDateController.text =
                          DateFormat("dd-MM-yy").format(date);
                    }
                  },
                  controller: treatmentDateController,
                  title: "Treatment Date"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          onTap: () {
                            hourBottomSheet(
                              context: context,
                              onTap: (hour) {
                                treatmentTimeHourController.text =
                                    hour.toString().padLeft(2, "0");
                                Navigator.pop(context);
                              },
                            );
                          },
                          isEnabled: false,
                          controller: treatmentTimeHourController,
                          hintText: "Hour",
                          title: "Treatment Time")),
                  SizedBox(
                    width: appSizeChart.padding_12.w,
                  ),
                  Expanded(
                      child: CustomTextField(
                          onTap: () {
                            minuteBottomSheet(
                              context: context,
                              onTap: (minute) {
                                treatmentTimeMinuteController.text =
                                    minute.toString().padLeft(2, "0");
                                Navigator.pop(context);
                              },
                            );
                          },
                          isEnabled: false,
                          controller: treatmentTimeMinuteController,
                          hintText: "Minute",
                          title: "")),
                ],
              ),
              SizedBox(
                height: appSizeChart.padding_30.sp,
              ),
              CustomButton(
                buttonName: "Save",
                onTap: () async {
                  PatientDetailsModel patientDetails = PatientDetailsModel(
                      id: 1,
                      name: "name",
                      user: "user",
                      whatsAppNumber: "222",
                      address: "address",
                      treatments: treatments,
                      totalAmount: 2,
                      discountAmount: 2,
                      advanceAmount: 2,
                      balanceAmount: 2,
                      treatmentDate: null);
                  // PatientDetailsModel(
                  //     id: 0,
                  //     name: nameController.text,
                  //     user: "",
                  //     whatsAppNumber: whatsappNumberController.text,
                  //     address: addressController.text,
                  //     treatments: treatments,
                  //     totalAmount: int.parse(totalController.text),
                  //     discountAmount: int.parse(discountController.text),
                  //     advanceAmount: int.parse(advanceController.text),
                  //     balanceAmount: int.parse(balanceController.text),
                  //     treatmentDate: DateTime.parse(
                  //         "${2024-11-23}-${treatmentTimeHourController.text}:${treatmentTimeMinuteController.text}"));
                  pw.Document doc =
                      await pdfConverter(patientDetails: patientDetails);
                  File file = await savePdf(name: "Name of pdf.pdf", pdf: doc);
                  print("file${file.path}");
                  await openPdfFile(file: file);
                },
              ),
              SizedBox(
                height: appSizeChart.padding_35.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
