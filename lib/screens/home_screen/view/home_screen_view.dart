import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/model/patient_details_model.dart';
import 'package:noviindus_machine_test/screens/authentication/sign_in/view/sign_in_view.dart';
import 'package:noviindus_machine_test/screens/home_screen/service/service.dart';
import 'package:noviindus_machine_test/screens/home_screen/view/widgets/register_patient_button.dart';
import 'package:noviindus_machine_test/screens/home_screen/view/widgets/search_sort_fields.dart';
import 'package:noviindus_machine_test/utils/app_bar/main_app_bar/main_app_bar.dart';
import 'package:noviindus_machine_test/utils/custom_divider/custom_divider.dart';
import 'package:noviindus_machine_test/utils/loading_screen/loading_screen.dart';
import 'package:noviindus_machine_test/utils/no_data_page/no_data_page.dart';

import 'widgets/patient_list_builder.dart';

class HomeScreenView extends ConsumerWidget {
  HomeScreenView({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        onTap: () async {
          loadingScreen(context);
          await sharedDataController.clearSharedData();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignInView(),
              ));
        },
      ),
      body: FutureBuilder(
        future: HomeScreenService.getPatientList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: appSizeChart.padding_20.w),
                  child: const SearchSortFields(),
                ),
                SizedBox(
                  height: appSizeChart.padding_12.h,
                ),
                const CustomDivider(),
                Expanded(
                    child: PatientListBuilder(
                  patients: snapshot.data!,
                )),
                const RegisterPatientButton()
              ],
            );
          } else {
            return const Column(
              children: [
                Expanded(child: NoDataPage()),
                RegisterPatientButton()
              ],
            );
          }
        },
      ),
    );
  }
}
