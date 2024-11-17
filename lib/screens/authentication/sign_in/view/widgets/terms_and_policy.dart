import 'package:flutter/material.dart';

import '../../../../../main.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: fontStyles.font12_300,
        children: <TextSpan>[
          const TextSpan(text: 'By creating or logging into an account you are agreeing with our '),
          TextSpan(
            text: 'Terms and Conditions ',
            style: fontStyles.font12_500Blue,
          ),
          const TextSpan(text: 'and '),
          TextSpan(
            text: 'Privacy Policy.',
            style: fontStyles.font12_500Blue,
          ),
        ],
      ),
    );
  }
}
