import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class Antwort1 extends StatefulWidget {
  const Antwort1({super.key});

  @override
  State<Antwort1> createState() => _Antwort1State();
}

class _Antwort1State extends State<Antwort1> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, top: 20),
      child: SizedBox(
        width: 250,
        height: 70,
        //?{AnimatedText with Animated Bear}\\
        child: TypeWriterText(
          repeat: false,
          play: true,
          text: Text(
            'Sehr gut das freut mich zu Hören :)',
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
