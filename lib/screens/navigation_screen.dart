import 'package:flutter/material.dart';

import './booking_screen.dart';
import './home_screen.dart';
import './account_screen.dart';
import '../widgets/content_drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  static final List<Widget> _tabs = <Widget>[
    //! Modifying this list requires you to update index variables.
    HomeScreen(),
    BookingScreen(),
    AccountScreen(),
  ];

  /// Switches tab.
  void _onItemTapped(int index) async {
    Navigator.of(context).pop();
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Toggles the drawer.
  void _toggleDrawer() {
    if (_key.currentState!.isDrawerOpen) {
      Navigator.pop(context);
    } else {
      _key.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Company logo here"),
        leading: IconButton(
          onPressed: () => _toggleDrawer(),
          icon: Icon(Icons.menu),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        key: _key,
        drawer: ContentDrawer(
          onItemTapped: _onItemTapped,
        ),
        body: _tabs.elementAt(_selectedIndex),
      ),
    );
  }
}
