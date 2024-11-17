import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/screens/register_patient/service/model/model.dart';
import 'package:noviindus_machine_test/screens/register_patient/view/widgets/payment_option_widget.dart';
import 'package:noviindus_machine_test/utils/app_bar/main_app_bar/main_app_bar.dart';
import 'package:noviindus_machine_test/utils/custom_button/custom_button.dart';
import 'package:noviindus_machine_test/utils/textfield/custom_textfield.dart';

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
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController treatmentDateController = TextEditingController();
  final TextEditingController treatmentTimeHourController =
      TextEditingController();
  final TextEditingController treatmentTimeMinuteController =
      TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    PaymentOption? paymentOption = ref.watch(paymentOptionController);
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
                controller: locationController,
                title: "Location",
                hintText: "Choose your location",
                isEnabled: false,
                onTap: () {},
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                controller: branchController,
                title: "Branch",
                hintText: "Select the branch",
                isEnabled: false,
                onTap: () {},
              ),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  controller: totalController, title: "Total Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  controller: discountController, title: "Discount Amount"),
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
                  controller: advanceController, title: "Advance Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  controller: treatmentController, title: "Treatment Amount"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              CustomTextField(
                  controller: treatmentDateController, title: "Treatment Date"),
              SizedBox(
                height: appSizeChart.padding_20.sp,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          controller: treatmentTimeHourController,
                          hintText: "Hour",
                          title: "Treatment Time")),
                  SizedBox(
                    width: appSizeChart.padding_12.w,
                  ),
                  Expanded(
                      child: CustomTextField(
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
                onTap: () {},
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
