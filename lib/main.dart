import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import '../design/app_theme.dart';
import './screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: HomeScreen(),
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
