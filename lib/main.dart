import 'package:auro/myapp.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/helpers/network_manager.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repository/authentication_repository.dart';
import 'data/repository/profile_repository.dart';
import 'features/firebase/firebase_api.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseApi().initNotifications();
  } catch (e) {
    print('Firebase already initialized: $e');
  }

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: "basic_chanel",
          channelName: "App Notifications",
          channelDescription: "Receive Updates and Alerts from our app.",
          importance: NotificationImportance.Max,
          playSound: true,
          enableVibration: true,
          defaultColor: TColors.primary,
          ledColor: TColors.primary),

      NotificationChannel(
          channelKey: "device_chanel",
          channelName: "Device Alert Notifications",
          channelDescription: "Receive Updates and Alerts for Devices.",
          importance: NotificationImportance.Max,
          playSound: true,
          enableVibration: true,
          defaultColor: TColors.secondary,
          ledColor: TColors.secondary),
    ],
    debug: true,
  );

  Get.put(ProfileRepository());

  await GetStorage.init();

  Get.put(AuthenticationRepository());

  Get.put(NetworkManager());

  runApp(const Myapp());
}
