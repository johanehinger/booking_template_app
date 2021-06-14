import 'package:flutter/material.dart';

import './booking_screen.dart';
import './home_screen.dart';
import '../widgets/auth_wall.dart';
import '../widgets/content_drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  /// Switches tab.
  void _onItemTapped(int index) {
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

  void hej() {
    print("hej");
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = <Widget>[
      //! Modifying this list requires you to update index variables.
      HomeScreen(
        setIndex: () => setState(
          () {
            _selectedIndex = 1;
          },
        ),
      ),
      BookingScreen(),
      AuthWall(),
    ];
    return Scaffold(
      primary: true,
      appBar: AppBar(
        elevation: 0,
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
          selectedIndex: _selectedIndex,
        ),
        body: _tabs.elementAt(_selectedIndex),
      ),
    );
  }
}
