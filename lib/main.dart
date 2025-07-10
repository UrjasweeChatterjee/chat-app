import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with emulator settings for development
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Disable reCAPTCHA verification for development
  if (!kReleaseMode) {
    try {
      // Use direct Firebase authentication without emulator
      await FirebaseAuth.instance.setSettings(
        appVerificationDisabledForTesting: true,
        forceRecaptchaFlow: false,
      );
    } catch (e) {
      print('Could not configure Firebase Auth: $e');
    }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return snapshot.hasData ? HomeScreen() : LoginScreen();
        },
      ),
    );
  }
}
