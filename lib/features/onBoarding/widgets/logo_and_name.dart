import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app1/core/Theming/text_style.dart';

class LogoAndName extends StatelessWidget
{
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SvgPicture.asset("assets/svgs/logo.svg"),
        SizedBox(width: 10.w,),
        Text("Docdoc",style: TextStyles.font24Black700Weight),

        
     ],
    );
  }
}
