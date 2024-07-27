// ignore_for_file: use_build_context_synchronously, empty_catches

import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tutor/src/constant/color.dart';


class NotificationsUtils {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final AwesomeNotifications _notifications = AwesomeNotifications();

  void initNotifications() {
    _notifications.initialize(
      'resource://drawable/notification_icon',
      [
        NotificationChannel(
          channelGroupKey: 'tgx_booking',
          channelKey: 'tgx',
          channelName: 'TGX Booking',
          channelDescription: 'TGX Booking',
          importance: NotificationImportance.High,
          enableVibration: true,
          playSound: true,
          defaultColor: ConstColor.buttonColor,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'tgx_booking',
          channelGroupName: 'TGX Bookings',
        ),
      ],
    );
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
  }

  void generateToken() async {
    try {
      await _messaging.requestPermission(
        sound: true,
        badge: true,
        alert: true,
        announcement: true,
        criticalAlert: true,
      );

      final token = await _messaging.getToken();
      // if (kSharedPreferences?.getString(ConstString.fcmToken) != token) {
      //   await kSharedPreferences?.setString(ConstString.fcmToken, token!);
      //   log("Token: $token");
      // }
    } catch (e) {
      log(e.toString());
    }
  }

  void sendNotification({
    required String message,
    required String type,
    required String peerfcmToken,
    required String title,
  }) async {
    try {
      // await dbHelper.sendNotification(
      //   title: title,
      //   message: message,
      //   type: type,
      //   peerfcmToken: peerfcmToken,
      // );
    } catch (e) {}
  }

  void messageListener() {
    FirebaseMessaging.onMessage.listen((event) async {
      showNotification(event);
    });
  }

  static Future<void> onTapNotification(ReceivedAction receivedAction) async {
    String meetingType = receivedAction.payload!['message_type'] ?? 'booking';
    if (meetingType == 'booking') {
      // currentTab.value = 2;
    }
  }

  void showNotification(RemoteMessage message) async {
    // Map<String, dynamic> data = jsonDecode(message.data['content']);
    Map<String, String>? payload = Map<String, String>.from(message.data);

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: payload['channelKey']!,
        title: payload['title'],
        body: payload['body'],
        groupKey: 'tgx_booking',
        payload: payload,
        roundedLargeIcon: true,
        backgroundColor: ConstColor.buttonColor,
      ),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  notificationsUtils.showNotification(message);
}

final NotificationsUtils notificationsUtils = NotificationsUtils();
