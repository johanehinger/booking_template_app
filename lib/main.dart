import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_influencer_template_app/design/theme_colors.dart';
import 'package:social_influencer_template_app/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_influencer_template_app/screens/tab_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: ThemeColors.primary,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            var signedIn = userSnapshot.hasData;
            return signedIn ? TabScreen() : AuthScreen();
          },
        ));
  }
}
