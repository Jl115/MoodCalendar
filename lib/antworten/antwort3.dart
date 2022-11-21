import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class Antwort3 extends StatefulWidget {
  const Antwort3({super.key});

  @override
  State<Antwort3> createState() => _Antwort3State();
}

class _Antwort3State extends State<Antwort3> {
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
            'Ahhh mann schade das tut mir leid...',
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
