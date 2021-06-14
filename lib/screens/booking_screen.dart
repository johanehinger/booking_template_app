import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/select_from_list.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen();

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Book appointment",
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SelectFromList(
                  label: "Select service",
                  listOfValue: [
                    "Haircut - 30min",
                    "Haircut - 45min",
                    "Coloring - 2h"
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SelectFromList(
                  label: "Select person",
                  listOfValue: ["Doesn't matter", "Jenny", "Hanna", "Franc"],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SelectFromList(
                  label: "Select time",
                  listOfValue: [
                    "210612 - 10:30",
                    "210612 - 11:00",
                    "210612 - 13:30"
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Continue"),
                    const SizedBox(
                      width: 12.0,
                    ),
                    FloatingActionButton(
                      tooltip: "Continue",
                      onPressed: () => print("book"),
                      child: Icon(Icons.arrow_forward),
                    ),
                    const SizedBox(
                      width: 24.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
