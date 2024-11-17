import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/splashscreen/view/splash_screen.dart';
import 'utils/api_routes/api_routes.dart';
import 'utils/image_data/image_data.dart';
import 'utils/shared_preference/shared_preference_controller.dart';
import 'utils/size_chart/app_size_chart.dart';
import 'utils/styles/color_theme.dart';
import 'utils/styles/font_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FontStyles fontStyles = FontStyles();
AppSizeChart appSizeChart = AppSizeChart();
AppColors appColors = AppColors();
ApiRoutes apiRoutes = ApiRoutes();
SharedDataController sharedDataController = SharedDataController();
ImageData imageData = ImageData();
ScreenUtil screenUtil = ScreenUtil();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kumarakom',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
