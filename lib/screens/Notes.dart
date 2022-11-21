import 'package:flutter/material.dart';
import 'package:mood_calendar/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mood_calendar/components/MyFloatingActionButton.dart';
import 'package:mood_calendar/components/habit_tile.dart';
import 'package:mood_calendar/components/myAlertBox.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  int _selectedIndex = 2;
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

  // create new kommi
  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    // show alert dialog to make a new Kommi
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          onSave: saveNewHabit,
          onCancel: cancelNewHabit,
          hintText: 'Enter Habit name...',
        );
      },
    );
  }

  //save new kommi
  void saveNewHabit() {
    //add new Kommi
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, true]);
    });

    //clear
    _newHabitNameController.clear();
    //pop kommi
    Navigator.of(context).pop();

    db.updateDatabase();
  }

  //cancel neuer kommi
  void cancelNewHabit() {
    //clear
    _newHabitNameController.clear();
    //pop kommis
    Navigator.of(context).pop();
  }

  //kommis settings

  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          onSave: () => saveExistinghabit(index),
          onCancel: cancelNewHabit,
          hintText: db.todaysHabitList[index][0],
        );
      },
    );
  }

  //speichere kommis
  void saveExistinghabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  //lösche kommis

  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      body: ListView(
        children: [
          // liste von den Kommis
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              //Kommis listen
              return HabitTile(
                habitCompleted: db.todaysHabitList[index][1],
                habitName: db.todaysHabitList[index][0],
                onChanged: (value) => (value),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            },
          )
        ],
      ),
    );
  }
}
