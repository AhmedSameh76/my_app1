import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/core/Routing/app_routers.dart';
import 'package:my_app1/core/Routing/routes.dart';
import 'package:my_app1/core/Theming/color.dart';
import 'package:my_app1/features/onBoarding/onboarding_screen.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true, minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        title: "Doc Doc",
        theme: ThemeData(
          primaryColor: ColorManger.primaryBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}
