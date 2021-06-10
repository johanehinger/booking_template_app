import 'package:booking_template_app/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _tabs = <Widget>[
    //! Modifying this list requires you to update index variables.
    Scaffold(),
    ProfileScreen(),
  ];

  /// Switches tab.
  void _onItemTapped(int index) async {
    Navigator.of(context).pop();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _tabs.elementAt(_selectedIndex),
      drawer: Drawer(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => _onItemTapped(0),
                child: Row(
                  children: [
                    Icon(Icons.home_filled),
                    const Text("Home"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _onItemTapped(1),
                child: Row(
                  children: [
                    Icon(Icons.account_box),
                    const Text("Account"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
