import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:mood_calendar/components/motivation.dart';
import 'package:mood_calendar/data/habit_database.dart';
import 'package:mood_calendar/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MonthlySummary extends StatefulWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  State<MonthlySummary> createState() => _MonthlySummaryState();
}

class _MonthlySummaryState extends State<MonthlySummary> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box('Habit_Database');
  @override
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
    return Container(
        padding: const EdgeInsets.only(top: 25, bottom: 25),
        child: HeatMap(
            startDate: createDateTimeObject(widget.startDate),
            endDate: DateTime.now().add(Duration(days: 0)),
            datasets: widget.datasets,
            colorMode: ColorMode.color,
            defaultColor: Colors.black54.withOpacity(0.3),
            textColor: Colors.white,
            showColorTip: false,
            showText: true,
            size: 35,
            scrollable: true,
            borderRadius: (10),
            margin: EdgeInsets.all(2),
            colorsets: const {
              1: Color.fromARGB(19, 73, 176, 124),
              2: Color.fromARGB(40, 52, 178, 176),
              3: Color.fromARGB(59, 44, 94, 163),
              4: Color.fromARGB(80, 72, 51, 131),
              5: Color.fromARGB(99, 151, 42, 138),
              6: Color.fromARGB(120, 138, 2, 179),
              7: Color.fromARGB(150, 138, 2, 179),
              8: Color.fromARGB(180, 138, 2, 179),
              9: Color.fromARGB(220, 138, 2, 179),
              10: Color.fromARGB(255, 138, 2, 179),
            },
            onClick: (value) {
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints(
                              maxHeight: 300, minWidth: 400),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black54.withOpacity(0.4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: ListView.builder(
                            itemCount: db.todaysHabitList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Motivation(
                                habitName: db.todaysHabitList[index][0],
                              );
                            },
                          ),
                        ));
                  });
            }));
  }
}
