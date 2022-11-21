import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, top: 20),
      child: SizedBox(
        width: 250,
        height: 70,
        //?{AnimatedText with Animated Bear}\\
        child: TypeWriterText(
          repeat: true,
          play: true,
          text: Text(
            'Test',
            style: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.3,
              fontSize: 20,
            ),
          ),
          duration: Duration(milliseconds: 130),
        ),
      ),
    );
  }
}
