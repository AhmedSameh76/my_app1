import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/core/di/debendncy_injection.dart';
import 'package:my_app1/core/helpers/const.dart';
import 'package:my_app1/core/helpers/extentaions.dart';
import 'package:my_app1/core/shared_prefrance/shared_pref_helper.dart';
import 'package:my_app1/core/widgets/push_notification_service.dart';
import 'package:my_app1/doc_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  await getIt<PushNotificationService>().init();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}