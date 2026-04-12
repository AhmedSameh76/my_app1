import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/Routing/routes.dart';
import '../../../core/Theming/color.dart';
import '../../../core/Theming/text_style.dart';

class GetStartBottom extends StatelessWidget {
  const GetStartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: TextButton(
        onPressed: () {
          context.push(Routes.login);
        },
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: WidgetStateProperty.all(ColorManger.primaryBlue),
        ),
        child: Text(
          "Get Started",
          style: TextStyles.font16White600,
        ),
      ),
    );
  }
}