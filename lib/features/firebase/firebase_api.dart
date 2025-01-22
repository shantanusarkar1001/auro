import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import '../../myapp.dart';
import '../../utils/preferences/cache_manager.dart';
import '../notificaations/view/notifications.dart';

class FirebaseApi {
  late BuildContext context;

  triggerBNotifiction() {}

  final _fireBaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fireBaseMessaging.requestPermission();

    final fcmToken = await _fireBaseMessaging.getToken();

    if (kDebugMode) {
      print("FCM_TOKEN $fcmToken");
    }

    SharedPrefs.setString("FCM_TOKEN", fcmToken.toString());
    if (kDebugMode) {
      print("FCM_TOKEN ==> SP :");
    }
    if (kDebugMode) {
      print(SharedPrefs.getString("FCM_TOKEN"));
    }

    initPushNotification();
  }

  void handelMessage(RemoteMessage? message) {
    if (message == null) return;

    Map<String, dynamic> data = message.data;

    String route = data['route'] ?? "";
    String deviceId = data['device_id'] ?? "";
    String startDate = data['start_date'] ?? "";
    String endDate = data['end_date'] ?? "";

    navigatorKey.currentState?.pushNamed(
     route/*"/powerDetail"*/,
      arguments: {
        'deviceId': deviceId/*"3071123300001"*/,
        'startDate': startDate/*"2024-12-01 00:00:00"*/,
        'endDate': endDate/*"2024-12-13 23:00:00"*/,
      },
    );
  }

  Future<void> initPushNotification() async {
    // Handle when the app is opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);

    // Handle when the app is opened from the background
    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);

    // Handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Message received in the foreground: ${message.notification?.body}');
        print('Message data: ${message.data}');
      }

      String channel = "";
      Map<String, dynamic> data = message.data;

      String channelKey = data['channelKey'] ?? "0";
      channel = channelKey == "1" ? "device_chanel" : "basic_chanel";

      createNotification(
        channelKey: channel,
        title: "${message.notification?.title}",
        body: "${message.notification?.body}",
        time: generateUniqueId(),
      );
    });

    // Request notification permissions (required for iOS)
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not granted permission');
    }

    // Retrieve the APNs token for iOS
    String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (kDebugMode) {
      print('APNs Token: $apnsToken');
    }

    // Retrieve the FCM token
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      print('FCM Token: $fcmToken');
    }
  }

  int generateUniqueId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomComponent =
        Random().nextInt(1000); // A random number between 0 and 999

    if (kDebugMode) {
      print("timestamp + randomComponent");
      print(timestamp + randomComponent);
      print(randomComponent);
      print(timestamp);
    }
    return /*timestamp +*/ randomComponent;
  }

  void createNotification(
      {required String? channelKey,
      required String? title,
      required String? body,
      required int? time}) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: time ?? 0,
        channelKey: channelKey.toString(),
        title: title,
        body: body,
      ),
    );
  }
}
