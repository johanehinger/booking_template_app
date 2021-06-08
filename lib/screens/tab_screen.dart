import 'package:flutter/material.dart';
import 'package:social_influencer_template_app/services/auth_service.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(
        onPressed: () => _authService.signOut(this.context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "hello",
          ),
        ],
      ),
    );
  }
}
