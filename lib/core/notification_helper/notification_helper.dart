import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/profile/presentation/screens/notifications.dart';
import 'firebase_options.dart';
import 'firebase_options.dart';

FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important team_notifications.', // description
  importance: Importance.high,
);

AndroidInitializationSettings? _initializationSettingsAndroid;
DarwinInitializationSettings? _initializationSettingsIos;
InitializationSettings? _initializationSettings;

class NotificationHelper {
  static init() async {
    await Firebase.initializeApp(
        name:"Azraqna",
        options:
        FirebaseOptions(
            apiKey: "AIzaSyBOP6_BXBtN0m8_zzYl6uISrSP7chd8tYA",
            appId: "1:997480396737:ios:03a4e1ec2339ba892a6140",
            messagingSenderId: "997480396737",
            projectId: "azraqna-a6abf")
    );
    FirebaseMessaging.onBackgroundMessage(_fireBaseBackgroundHandler);
    FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }
static String? firebaseToken;
  static onInit() {
    _initNotification();

    print("<<<<<<<<<<<<<<<<<<<<<< Welcome back >>>>>>>>>>>>>>>>>>>>>>");
    FirebaseMessaging.instance.getToken().then((value) async {
      print("Device Id:::: ${value.toString()}");
      firebaseToken=value.toString();
      print("firebaseToken: $firebaseToken");
    });

    ///======================== Welcome notification ========================
    // FlutterRingtonePlayer.playNotification().then((value) =>
    //     print("<<<<<<<<<<<<notification played successfully>>>>>>>>>>>>"));
    // _showNotification("Consumer plus", "welcome to consumer plus");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("onMessage: $message");
      _showNotification(
          message.notification?.title, message.notification?.body);
      FlutterRingtonePlayer.playNotification(
        looping: false, // Android only - API >= 28
        volume: 0.1, // Android only - API >= 28
        asAlarm: true, // Android only - all APIs
      );
      RouteManager.navigateTo(NotificationsScreen());
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onLaunch: $message");
      _showNotification(
          message.notification!.title, message.notification!.body);
      FlutterRingtonePlayer.playNotification(
        looping: false, // Android only - API >= 28
        volume: 0.1, // Android only - API >= 28
        asAlarm: false, // Android only - all APIs
      );
      RouteManager.navigateTo(NotificationsScreen());
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print("onResume: $message");
      _showNotification(
          message.notification!.title, message.notification!.body);
      FlutterRingtonePlayer.playNotification(
        looping: false, // Android only - API >= 28
        volume: 0.1, // Android only - API >= 28
        asAlarm: false, // Android only - all APIs
      );
    });
  }


}

/// - - - - > > methods.. < < - - - -
void _showNotification(var title, var body) async {
  await _customNotification(title, body);
}

Future<void> _customNotification(var title, var body) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'channel_ID',
    'channel_Name',
    channelDescription: 'channel_Description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'test ticker',
  );
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await _flutterLocalNotificationsPlugin
      .show(0, title, body, platformChannelSpecifics, payload: 'Custom_Sound');
}

Future _initNotification() async {
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  _initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  /// < - - ICON..
  _initializationSettingsIos = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: false,
  );
  _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid, iOS: _initializationSettingsIos);
  await _flutterLocalNotificationsPlugin.initialize(_initializationSettings!);
}

Future<void> _fireBaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
      name:'Azraqna',
      options:
      FirebaseOptions(
          apiKey: "AIzaSyBOP6_BXBtN0m8_zzYl6uISrSP7chd8tYA",
          appId: "1:997480396737:ios:03a4e1ec2339ba892a6140",
          messagingSenderId: "997480396737",
          projectId: "azraqna-a6abf")
  );
  print("Handling a background message: ${message.messageId}");
}
