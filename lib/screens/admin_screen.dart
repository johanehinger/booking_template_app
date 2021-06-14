import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../services/auth_service.dart';
import '../widgets/calendar.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  AuthService _authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            FloatingActionButton(
              onPressed: () => _authService.signOut(context),
            ),
            Text("AdminScreen"),
            Calendar(date: now),
          ],
        ),
      ),
    );
  }
}
