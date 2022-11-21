import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_calendar/Home.dart';
import 'package:mood_calendar/components/Button.dart';
import 'package:mood_calendar/question_pages/Question_i.dart';

void main() async {
  // inizislisiere hive
  await Hive.initFlutter();
  await Question();

  //öfnenen einer box
  await Hive.openBox('Habit_Database');
  await Hive.openBox('Gefuehle_Database');
  await Question();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Question(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.transparent,
      ),
    );
  }
}
