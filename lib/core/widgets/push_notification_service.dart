import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // 1. طلب الصلاحية من المستخدم
    await _firebaseMessaging.requestPermission();

    // 2. إعدادات ظهور الإشعار والتطبيق مفتوح
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    // التعديل الأخير: استخدام كلمة 'settings'
    await _localNotificationsPlugin.initialize(settings: initSettings);

    // 3. الاستماع للإشعارات والتطبيق مفتوح في الشاشة
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message in the foreground: ${message.notification?.title}');
      if (message.notification != null) {
        _showLocalNotification(message);
      }
    });

    // 4. طباعة التوكن (عشان لو حبيت تبعت إشعار لموبايلك إنت بس بعدين)
    String? token = await _firebaseMessaging.getToken();
    log('🔔 Firebase Token: $token');
  }

  // دالة مخصصة لرسم الإشعار على الشاشة
  void _showLocalNotification(RemoteMessage message) {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'docdoc_channel', // Channel ID
          'DocDoc Notifications', // Channel Name
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    _localNotificationsPlugin.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: platformDetails,
    );
  }
}
