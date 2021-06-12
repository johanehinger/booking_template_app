import 'package:booking_template_app/design/theme_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/account_screen.dart';
import '../screens/auth_screen.dart';

class AuthWall extends StatefulWidget {
  const AuthWall({Key? key}) : super(key: key);

  @override
  _AuthWallState createState() => _AuthWallState();
}

class _AuthWallState extends State<AuthWall> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ThemeColors.primaryColor,
                ),
              ),
            ),
          );
        }
        var signedIn = userSnapshot.hasData;
        return signedIn ? AccountScreen() : AuthScreen();
      },
    );
  }
}
