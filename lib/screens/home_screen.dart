import 'package:flutter/material.dart';

import './profile_screen.dart';
import '../widgets/content_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  static final List<Widget> _tabs = <Widget>[
    //! Modifying this list requires you to update index variables.
    Scaffold(),
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
