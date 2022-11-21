import 'package:mood_calendar/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box('Gefuehle_Database');

class GefuehleDatabase {
  List todaysGefuehleList = [];
  Map<DateTime, int> heatMapDataSet = {};

  // create initial default Data
  void Gefuehle<int>() {
    todaysGefuehleList = [
      [1, false],
      [2, false],
    ];

    _myBox.put('START_DATE', todaysDateFormatted());
  }

  // load the Data
  void loadData() {
    // check new Day get Habit database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysGefuehleList = _myBox.get('CURRENT_Gefuehle_Data');
      //set all habbit to false
      for (int i = 0; i < todaysGefuehleList.length; i++) {
        todaysGefuehleList[i][1] = false;
      }
    }
    //if not load todaysList
    else {
      todaysGefuehleList = _myBox.get(todaysDateFormatted());
    }
  }

  // uptade the data base
  void updateDatabase() {
    // update todays entry
    _myBox.put(todaysDateFormatted(), todaysGefuehleList);

    // update universal habitList
    _myBox.put("CURRENT_Gefuehle_Data", todaysGefuehleList);

    //calculate habit percentage
    calculateHabitPercentages();
    // load heatmap
    loadHeatMap();
  }

  void calculateHabitPercentages() {
    int CountCompleted = 0;
    for (int i = 0; i < todaysGefuehleList.length; i++) {
      if (todaysGefuehleList[i][1] == true) {
        CountCompleted++;
      }
    }
    String percent = todaysGefuehleList.isEmpty
        ? '0.0'
        : (CountCompleted / todaysGefuehleList.length).toStringAsFixed(1);
    // key: "Percentage_summary_yyyymmdd"
    // value: string of 1dp number between 0-1
    _myBox.put('PERCENTAGE_SUMMARY_${todaysDateFormatted()}', percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get('START_DATE'));

    //count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        _myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      // year
      int year = startDate.add(Duration(days: i)).year;

      // month
      int month = startDate.add(Duration(days: i)).month;

      // day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}
