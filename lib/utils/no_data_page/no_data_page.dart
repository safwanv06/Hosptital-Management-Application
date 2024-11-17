import 'package:flutter/cupertino.dart';
import 'package:noviindus_machine_test/main.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(imageData.notFoundImage));
  }
}
