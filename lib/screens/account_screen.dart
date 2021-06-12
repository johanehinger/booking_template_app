import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../design/theme_colors.dart';
import './admin_screen.dart';
import './user_screen.dart';
import '../widgets/Corrupted_user.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    User? _user = FirebaseAuth.instance.currentUser;
    DocumentReference _userInfo =
        FirebaseFirestore.instance.collection('users').doc(_user!.uid);
    return FutureBuilder(
      future: _userInfo.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong.");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return CorruptedUser();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data['role'] == "user") {
            return UserScreen();
          }
          if (data['role'] == "admin") {
            return AdminScreen();
          }
          return CorruptedUser();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                ThemeColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
