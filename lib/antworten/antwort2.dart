import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class Antwort2 extends StatefulWidget {
  const Antwort2({super.key});

  @override
  State<Antwort2> createState() => _Antwort2State();
}

class _Antwort2State extends State<Antwort2> {
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
            'Das ist doch gut schreib doch ein par Notizen was du verbessern kannst.',
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
