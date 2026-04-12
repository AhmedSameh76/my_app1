import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';

class TextStyles {
  static  TextStyle font24Black700Weight = TextStyle(
    fontSize : 24.sp,
    fontWeight : FontWeight.w700,
    color : Colors.black,
  );
  static TextStyle font32BlueBold = TextStyle(
    fontSize : 32.sp,
    fontWeight : FontWeight.bold,
    color : ColorManger.primaryBlue,
  );
  static TextStyle font13GrayRegular = TextStyle(
    fontSize : 13.sp,
    fontWeight : FontWeight.normal,
    color : ColorManger.gary,
  );
  static TextStyle font16White600 = TextStyle(
    fontSize : 16.sp,
    fontWeight : FontWeight.w600,
    color : Colors.white,
  );

}