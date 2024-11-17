import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/screens/register_patient/controller/controller.dart';
import 'package:noviindus_machine_test/utils/custom_radio_button/custom_radio_button.dart';

import '../../../../main.dart';
import '../../service/model/model.dart';

class PaymentOptionWidget extends ConsumerWidget {
  PaymentOptionWidget({super.key, required this.paymentOption});

  PaymentOption? paymentOption;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Option",
          style: fontStyles.font12_300,
        ),
        SizedBox(
          height: appSizeChart.padding_6.h,
        ),
        Row(children: [
          CustomRadioButton(isEnabled: paymentOption == PaymentOption.cash,onTap:() {
            ref.read(paymentOptionController.notifier).state=PaymentOption.cash;
          },),
          SizedBox(
            width: appSizeChart.padding_6.w,
          ),
          Text(
            "Cash",
            style: fontStyles.font16_400,
          ),
          const Spacer(),
          CustomRadioButton(isEnabled: paymentOption == PaymentOption.card,onTap: () {
            ref.read(paymentOptionController.notifier).state=PaymentOption.card;
          },),
          SizedBox(
            width: appSizeChart.padding_6.w,
          ),
          Text(
            "Card",
            style: fontStyles.font16_400,
          ),
          const Spacer(),
          CustomRadioButton(isEnabled: paymentOption == PaymentOption.UPI,onTap: () {
            ref.read(paymentOptionController.notifier).state=PaymentOption.UPI;
          },),
          SizedBox(
            width: appSizeChart.padding_6.w,
          ),
          Text(
            "UPI",
            style: fontStyles.font16_400,
          ),
        ]),
      ],
    );
  }
}
