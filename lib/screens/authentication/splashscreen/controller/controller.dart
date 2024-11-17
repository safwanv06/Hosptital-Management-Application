import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../utils/shared_preference/shared_preference_keys.dart';

class SplashScreenController {
  static Future authCheckController({required BuildContext context}) async {
    String token = await sharedDataController.getSharedData(
        key: SharedPreferenceKeys.token);
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (token != "") {
        }
        else{
        }
      },
    );
  }
}
