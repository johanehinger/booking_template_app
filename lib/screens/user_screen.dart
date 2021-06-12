import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  AuthService _authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () => _authService.signOut(context),
          ),
          Text("UserScreen"),
        ],
      ),
    );
  }
}
