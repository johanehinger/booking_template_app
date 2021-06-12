import '../services/auth_service.dart';
import 'package:flutter/material.dart';

class CorruptedUser extends StatelessWidget {
  CorruptedUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _authService = new AuthService();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            const Text("User is corrupted, please contact administators."),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () => _authService.signOut(context),
              child: const Text("Ok"),
            ),
          ],
        ),
      ),
    );
  }
}
