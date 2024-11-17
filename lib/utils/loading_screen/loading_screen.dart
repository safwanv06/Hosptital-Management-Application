import 'package:flutter/material.dart';

loadingScreen(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const LoadingScreen();
    },
  );
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
