import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Theming/color.dart';
import '../Theming/text_style.dart';

class AppTextFormField extends StatelessWidget {
  final InputBorder? focusedBorder;

  final InputBorder? enabledBorder;

  final String hintText;
  final Widget? suffixIcon;

  final TextStyle? hintStyle;

  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;

  const AppTextFormField({
    super.key,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.suffixIcon,
    this.hintStyle,
    this.obscureText,
    this.contentPadding, this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        isDense: true,
        focusedBorder: focusedBorder?? OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primaryBlue, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder:enabledBorder ?? OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.lighterGary, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle:hintStyle?? TextStyles.font14lightGaryRegular,
        hintText: hintText,
        suffixIcon: suffixIcon?? suffixIcon,
        fillColor: fillColor ??ColorManger.backgroundFormGray,
        filled: true,
      ),
      obscureText:obscureText ?? false,
      style: TextStyles.font14darkBlueRegular,
    );
  }
}
