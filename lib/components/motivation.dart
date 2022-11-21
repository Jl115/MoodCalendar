import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:expandable_text/expandable_text.dart';

class Motivation extends StatelessWidget {
  final String habitName;
  const Motivation({
    super.key,
    required this.habitName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
    );
  }
}
