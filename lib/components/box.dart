import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class Box extends StatelessWidget {
  final String text;

  Box({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.black54.withOpacity(0.4),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 15.0,
            ),
            child: ExpandableText(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
              expandText: 'show more',
              collapseText: 'show less',
              collapseOnTextTap: true,
              expandOnTextTap: true,
            ),
          )),
        ),
      ),
    );
  }
}
