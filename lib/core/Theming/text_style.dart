import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/core/Theming/text_style_helper.dart';
import 'color.dart';

class TextStyles {
  static  TextStyle font24BlackBold = TextStyle(
    fontSize : 24.sp,
    fontWeight : TextStyleHelper.bold,
    color : Colors.black,
  );
  static TextStyle font24BlueBold = TextStyle(
    fontSize : 24.sp,
    fontWeight : TextStyleHelper.bold,
    color : ColorManger.primaryBlue,
  );
  static TextStyle font16BlueRegular = TextStyle(
    fontSize : 16.sp,
    fontWeight : TextStyleHelper.regular,
    color : Colors.white,
  );
  static TextStyle font13BlueRegular = TextStyle(
    fontSize : 13.sp,
    fontWeight : TextStyleHelper.regular,
    color : Colors.white,
  );
  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize : 13.sp,
    fontWeight : TextStyleHelper.semibold,
    color : ColorManger.primaryBlue,
  );
  static TextStyle font13GrayRegular = TextStyle(
    fontSize : 13.sp,
    fontWeight : TextStyleHelper.regular,
    color : ColorManger.gary,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontSize : 14.sp,
    fontWeight : TextStyleHelper.regular,
    color : ColorManger.gary,
  );
  static TextStyle font14lightGaryRegular = TextStyle(
    fontSize : 14.sp,
    fontWeight : TextStyleHelper.regular,
    color : ColorManger.lightGary,
  );
  static TextStyle font14darkBlueRegular = TextStyle(
    fontSize : 14.sp,
    fontWeight : TextStyleHelper.regular,
    color : ColorManger.darkBlue,
  );
  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize : 13.sp,
    fontWeight : TextStyleHelper.regular,
    color : ColorManger.darkBlue,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize : 16.sp,
    fontWeight : TextStyleHelper.semibold,
    color : Colors.white,
  );

}