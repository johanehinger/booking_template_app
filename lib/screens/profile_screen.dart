import 'package:booking_template_app/screens/auth_screen.dart';
import 'package:booking_template_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthService _authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
        return signedIn
            ? Scaffold(
                body: FloatingActionButton(
                  onPressed: () => _authService.signOut(context),
                ),
              )
            : AuthScreen();
      },
    );
  }
}
