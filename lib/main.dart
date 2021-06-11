import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import '../design/app_theme.dart';
import './screens/navigation_screen.dart';

/// Requires that a Firestore emulator is running locally.
/// See https://firebase.flutter.dev/docs/firestore/usage#emulator-usage
const bool USE_FIRESTORE_EMULATOR = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = const Settings(
      host: 'localhost:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppTheme _appTheme = new AppTheme();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _appTheme.themeData,
      home: NavigationScreen(),
      // __________________
      // TabScreen(),
      //___________________
      // StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, userSnapshot) {
      //     if (userSnapshot.connectionState == ConnectionState.waiting) {
      //       return Scaffold(
      //         body: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //     }
      //     var signedIn = userSnapshot.hasData;
      //     return signedIn ? TabScreen() : AuthScreen();
      //   },
      // ),
    );
  }
}
