import 'dart:async';
import 'dart:io';

// import 'package:alice/alice.dart';
import '../constants/api_constants.dart';
import 'package:dio/dio.dart';

import '../config/dio_config.dart';
import '../repository/api_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/globals.dart' as globals;
// import 'package:rus_tili/config/audio_service.dart';
// import 'package:rus_tili/config/dynamic_link_service.dart';
// import 'package:rus_tili/pages/main_page_faqs/main_page_faqs_logic.dart';
// import 'package:rus_tili/repository/model/set_fcm_model.dart';
// import 'package:rus_tili/style/app_colors.dart';
import '../utils/api_utils.dart';
// import 'package:rus_tili/utils/assets_manager.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

/// Create a [AndroidNotificationChannel] for heads up notifications
// late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

const CHANNEL_ID = "MOSTBYTE_ORDER_CHANNEL_ID";
const CHANNEL_NAME = "MOSTBYTE_ORDER";
const CHANNEL_DESC = "MOSTBYTE_ORDER";

const bool withAuth = true;
const bool withAlice = false;
// Alice alice = Alice();

// const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//   CHANNEL_ID,
//   CHANNEL_NAME,
//   importance: Importance.max,
//   priority: Priority.high,
//   ticker: 'ticker',
//   playSound: true,
//   enableLights: true,
//   autoCancel: false,
//   // channelShowBadge: true,
//   visibility: NotificationVisibility.public,
//   enableVibration: true,
//   // icon: 'assets/images/icons/IZI.png',
// );
// const DarwinNotification iOSPlatformChannelSpecifics =
//     DarwinNotificationDetails(threadIdentifier: 'thread_id');

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  HttpOverrides.global = MyHttpOverrides();
  // final restClient = Get.find<RestClient>();
  // var responseData = await restClient.filialList();
  // globals.filials = responseData.object!;

  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // // Set the background messaging handler early on, as a named top-level function

  // if (!kIsWeb) {
  //   channel = const AndroidNotificationChannel(
  //     CHANNEL_ID,
  //     CHANNEL_NAME,
  //     importance: Importance.high,
  //   );

  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //   /// Create an Android Notification Channel.
  //   ///
  //   /// We use this channel in the `AndroidManifest.xml` file to override the
  //   /// default FCM channel to enable heads up notifications.
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);

  //   /// Update the iOS foreground notification presentation options to allow
  //   /// heads up notifications.
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //   FirebaseMessaging.onMessage.listen((message) {
  //     // final audioService = Get.find<AudioService>();
  //     // audioService.playNotification();
  //     Get.snackbar(
  //       message.notification?.title ?? '',
  //       message.notification?.body ?? '',
  //       backgroundColor: Colors.grey.withOpacity(0.8),
  //       colorText: Colors.white,
  //     );
  //     var data = message.data;
  //     print(data);

  //     // if (data['action'] == 'FAQ_NEW_ANSWER') {
  //     //   MainPageFaqsLogic mainPageFaqsLogic = Get.find();
  //     //   mainPageFaqsLogic.fetchFaqsCount();
  //     // }
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((message) {
  //     _showNotification(message);
  //   });
  //   FirebaseMessaging.onBackgroundMessage((message) {
  //     _showNotification(message);
  //     return Future.value();
  //   });
  //   FirebaseMessaging.instance
  //       .requestPermission(sound: true, alert: true, announcement: true)
  //       .then((value) async {
  //     var token = await FirebaseMessaging.instance.getToken();
  //     RestClient restClient = Get.find();
  //     print("FCM TOKEN : $token");
  //     if (token != null) {
  //       // restClient.setFcm(SetFcmModel(token));
  //     }
  //   });
  // }

  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}

// void _showNotification(RemoteMessage message) {
//   flutterLocalNotificationsPlugin.show(
//     message.hashCode,
//     message.notification?.title,
//     message.notification?.body,
//     NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       // iOS: iOSPlatformChannelSpecifics,
//     ),
//   );
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }
