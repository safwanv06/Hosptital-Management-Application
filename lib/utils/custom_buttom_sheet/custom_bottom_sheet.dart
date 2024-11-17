import 'package:flutter/material.dart';

customBottomSheet({required BuildContext context,required Widget child}) {
  return showModalBottomSheet(
    enableDrag: true,
    useSafeArea: true,
    isScrollControlled: true,
    isDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}
