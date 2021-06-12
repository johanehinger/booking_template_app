import 'package:booking_template_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  AuthService _authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () => _authService.signOut(context),
          ),
          Text("AdminScreen"),
        ],
      ),
    );
  }
}
