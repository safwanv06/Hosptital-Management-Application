import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noviindus_machine_test/main.dart';
import 'package:noviindus_machine_test/screens/authentication/sign_in/controller/controller.dart';
import 'package:noviindus_machine_test/screens/authentication/sign_in/service/service.dart';
import 'package:noviindus_machine_test/screens/authentication/sign_in/view/widgets/terms_and_policy.dart';
import 'package:noviindus_machine_test/screens/home_screen/view/home_screen_view.dart';
import 'package:noviindus_machine_test/utils/custom_button/custom_button.dart';
import 'package:noviindus_machine_test/utils/custom_flushbar/custom_flushbar.dart';
import 'package:noviindus_machine_test/utils/custom_flushbar/model/flushbar_type.dart';
import 'package:noviindus_machine_test/utils/loading_screen/loading_screen.dart';
import 'package:noviindus_machine_test/utils/textfield/custom_textfield.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            imageData.signInBanner,
            height: appSizeChart.signInBannerHeight,
            width: screenUtil.screenWidth,
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: appSizeChart.padding_20.w,
                  vertical: appSizeChart.padding_30.h),
              child: Column(
                children: [
                  Text(
                    "Login or register to book your appointments",
                    style: fontStyles.font24_600,
                  ),
                  SizedBox(
                    height: appSizeChart.padding_30.h,
                  ),
                  CustomTextField(
                    controller: emailController,
                    title: "Email",
                    hintText: "Enter your email",
                  ),
                  SizedBox(
                    height: appSizeChart.padding_24.h,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    title: "Password",
                    hintText: "Enter password",
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonName: "Login",
                    onTap: () {
                      if (SignInController.validateSignIn(
                          userName: emailController.text,
                          password: passwordController.text)) {
                        loadingScreen(context);
                        SignInService.signIn(
                                userName: emailController.text,
                                password: passwordController.text)
                            .then(
                          (value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreenView(),
                                ));
                          },
                        ).onError(
                          (error, stackTrace) {
                            Navigator.pop(context);
                            flushBarNotification(
                                context: context,
                                message: "Login failed!!",
                                type: FlushBarType.error);
                          },
                        );
                      } else {
                        flushBarNotification(
                            context: context,
                            message: "Enter username and password.",
                            type: FlushBarType.warning);
                      }
                    },
                  ),
                  const Spacer(),
                  const TermsAndPolicy()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
