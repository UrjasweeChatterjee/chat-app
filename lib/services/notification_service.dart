import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  initFCM() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fcmToken");

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message clicked!");
      print("Message data: ${message.data}");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received!");
      print("Message: ${message.notification?.title}");
    });
  }
}
