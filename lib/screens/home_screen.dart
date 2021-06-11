import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 1,
      children: [
        Card(
          child: Text("NewsPost"),
        ),
        Card(
          child: Text("NewsPost"),
        ),
        Card(
          child: Text("NewsPost"),
        ),
        Card(
          child: Text("NewsPost"),
        ),
      ],
    ));
  }
}
