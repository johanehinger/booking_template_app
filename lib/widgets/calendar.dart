import 'package:booking_template_app/widgets/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import '../design/theme_colors.dart';
import '../design/app_theme.dart';

class Calendar extends StatefulWidget {
  final DateTime date;
  const Calendar({required this.date, Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<FlutterWeekViewEvent> _getEvents(DateTime date) {
    return [
      CalendarEvent(
        title: "hej",
        description: "Yo" + "\n" + "hej",
        start: DateTime(date.year, date.month, date.day, 9, 30),
        end: DateTime(date.year, date.month, date.day, 10, 30),
        context: context,
      ).calendarEvent,
    ];
  }

  @override
  Widget build(BuildContext context) {
    AppTheme _appTheme = new AppTheme();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.contourColor,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: ThemeColors.contourColor),
                  right: BorderSide(
                    style: BorderStyle.solid,
                    color: ThemeColors.contourColor,
                  ),
                ),
              ),
              child: DayView(
                dayBarStyle: _appTheme.dayBarStyle,
                hoursColumnStyle: HoursColumnStyle(
                  width: 40,
                ),
                minimumTime: HourMinute(hour: 7, minute: 30),
                maximumTime: HourMinute(hour: 17, minute: 30),
                userZoomable: false,
                date: widget.date,
                events: _getEvents(widget.date),
                style: DayViewStyle.fromDate(
                  date: widget.date,
                  currentTimeCircleColor: Colors.pink,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: ThemeColors.contourColor),
                  right: BorderSide(
                    style: BorderStyle.solid,
                    color: ThemeColors.contourColor,
                  ),
                ),
              ),
              child: DayView(
                dayBarStyle: _appTheme.dayBarStyle,
                hoursColumnStyle: HoursColumnStyle(width: 0),
                minimumTime: HourMinute(hour: 7, minute: 30),
                maximumTime: HourMinute(hour: 17, minute: 30),
                userZoomable: false,
                date: widget.date.add(Duration(days: 1)),
                events: _getEvents(
                  widget.date.add(
                    Duration(days: 1),
                  ),
                ),
                style: DayViewStyle.fromDate(
                  date: widget.date,
                  currentTimeCircleColor: Colors.pink,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: ThemeColors.contourColor),
                  right: BorderSide(
                    style: BorderStyle.solid,
                    color: ThemeColors.contourColor,
                  ),
                ),
              ),
              child: DayView(
                dayBarStyle: _appTheme.dayBarStyle,
                hoursColumnStyle: HoursColumnStyle(width: 0),
                minimumTime: HourMinute(hour: 7, minute: 30),
                maximumTime: HourMinute(hour: 17, minute: 30),
                userZoomable: false,
                date: widget.date.add(Duration(days: 2)),
                events: _getEvents(
                  widget.date.add(
                    Duration(days: 2),
                  ),
                ),
                style: DayViewStyle.fromDate(
                  date: widget.date,
                  currentTimeCircleColor: Colors.pink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
