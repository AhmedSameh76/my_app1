import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/core/Theming/color.dart';
import 'package:my_app1/core/Theming/text_style.dart';
import 'package:my_app1/core/Theming/text_style_helper.dart';
import 'package:my_app1/features/login/presentation/widgets/already_have%20account.dart';
import 'package:my_app1/features/login/presentation/widgets/terms_text.dart';
import '../../../core/Helpers/spacing.dart';
import '../../../core/Widgets/app_button.dart';
import '../../../core/Widgets/app_text_ form_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpace(16),
                      AppTextFormField(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        obscureText: obscureText,
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                       child:  Text("Forgot Password?",style: TextStyles.font13BlueRegular,),
                      ),
                      verticalSpace(40),
                      AppTextButton(buttonText: 'Login', textStyle: TextStyles.font16BlueRegular, onPressed: () {},),
                      verticalSpace(16),
                      DontHaveAccountText(),
                      verticalSpace(40),
                      TermsAndConditionsText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
