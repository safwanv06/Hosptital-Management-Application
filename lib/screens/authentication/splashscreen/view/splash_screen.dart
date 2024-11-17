import 'package:flutter/material.dart';

import '../controller/controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(future: SplashScreenController.authCheckController(context: context), builder: (context, snapshot) {
          return Center(child: Text("Splash Screen"));
        },),
      ),
    );
  }
}
