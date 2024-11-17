import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/main.dart';

import '../controller/controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: SplashScreenController.authCheckController(context: context),
          builder: (context, snapshot) {
            return Image.asset(
              imageData.splashScreenBg,
              height: screenUtil.screenHeight,
              width: screenUtil.screenWidth,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
