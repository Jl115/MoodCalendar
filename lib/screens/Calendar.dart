import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_calendar/components/habit_tile.dart';
import 'package:mood_calendar/components/month_summary.dart';
import 'package:mood_calendar/data/habit_database.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  final _myBox = Hive.box('Habit_Database');
  HabitDatabase db = HabitDatabase();

  void initState() {
    //check first time data
    if (_myBox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultData();
    }
    //not first time load data
    else {
      db.loadData();
    }
    // update data
    db.updateDatabase();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MonthlySummary(
        datasets: db.heatMapDataSet,
        startDate: _myBox.get(
          'START_DATE',
        ),
      ),

      // list of habits
    ));
  }
}
