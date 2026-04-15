
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app1/core/Theming/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gooooooo"),
        backgroundColor: ColorManger.primaryBlue,
      ),
      body: Center(
        child:  Text(" login screen"),


      ),
    );
  }
}
