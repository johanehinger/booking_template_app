import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './auth_screen.dart';
import '../services/auth_service.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
