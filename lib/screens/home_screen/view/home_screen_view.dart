import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/screens/authentication/sign_in/view/sign_in_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              InkWell(
                  onTap: () async {
                    await sharedDataController.clearSharedData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInView(),
                        ));
                  },
                  child: Icon(Icons.signal_cellular_0_bar))
            ],
          ),
        ),
      ),
    );
  }
}
