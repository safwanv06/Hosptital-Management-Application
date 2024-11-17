import 'package:flutter/material.dart';

import '../../main.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller, this.onTap, this.onChanged});

  final Function()? onTap;
  final Function(String value)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: fontStyles.font16Black,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
