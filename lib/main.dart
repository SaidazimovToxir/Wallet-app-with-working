import 'package:flutter/material.dart';
import 'package:lesson38/pages/log_in_page.dart';

void main() => runApp(const MyCalendarApp());

class MyCalendarApp extends StatelessWidget {
  const MyCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogInPage(),
    );
  }
}
