
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/core/Theming/text_style.dart';
import 'package:my_app1/features/onBoarding/widgets/get_start_bottom.dart';
import 'package:my_app1/features/onBoarding/widgets/image_and_text.dart';
import 'package:my_app1/features/onBoarding/widgets/logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: SingleChildScrollView(
         child: Padding(
           padding:EdgeInsets.only(
             top: 30.h,
             bottom: 30.h,
           ),
           child: Column(
             children: [
                const LogoAndName(),
               SizedBox(height: 30.h,),
               const ImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:15.w),
                child: Column(
                  children: [
                    Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                      style: TextStyles.font13GrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h,),
                    GetStartBottom(),
                  ],
                ),
              )
             ],
           ),
         ),
       ),
      ),
    );
  }
}
