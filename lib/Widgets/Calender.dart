import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TableCalendar(
                focusedDay: today,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2024, 12, 31))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Calender(),
  ));
}
