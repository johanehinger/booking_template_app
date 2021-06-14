import 'package:booking_template_app/design/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class CalendarEvent {
  final String title;
  final String description;
  final DateTime start;
  final DateTime end;
  final BuildContext context;
  CalendarEvent({
    required this.title,
    required this.description,
    required this.start,
    required this.end,
    required this.context,
  });

  AlertDialog _alertDialog(
      {required String title, required String description}) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title),
      content: Text(description),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Ok"),
        ),
      ],
    );
  }

  FlutterWeekViewEvent get calendarEvent {
    return FlutterWeekViewEvent(
      title: title,
      description: description,
      start: start,
      end: end,
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return _alertDialog(title: title, description: description);
        },
      ),
    );
  }
}
