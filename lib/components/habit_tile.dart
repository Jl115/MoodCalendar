import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:expandable_text/expandable_text.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;
  const HabitTile({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // settings option
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Colors.deepPurple.shade800,
              borderRadius: BorderRadius.circular(10),
              icon: Icons.settings,
            ),

            // delete Option
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Color.fromARGB(255, 106, 30, 30),
              borderRadius: BorderRadius.circular(10),
              icon: Icons.delete_forever,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.black54.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: ExpandableText(
                    expandText: 'show more',
                    collapseText: 'show less',
                    collapseOnTextTap: true,
                    expandOnTextTap: true, //Habit Name
                    habitName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
