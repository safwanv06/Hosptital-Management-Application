import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/screens/authentication/sign_in/view/sign_in_view.dart';
import 'package:noviindus_machine_test/screens/home_screen/view/home_screen_view.dart';

import '../../../../main.dart';
import '../../../../utils/shared_preference/shared_preference_keys.dart';

class SplashScreenController {
  static Future authCheckController({required BuildContext context}) async {
    String token = await sharedDataController.getSharedData(
        key: SharedPreferenceKeys.token);
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (token != "") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomeScreenView(),
              ));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>  SignInView()));
        }
      },
    );
  }
}
