import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class Antwort4 extends StatefulWidget {
  const Antwort4({super.key});

  @override
  State<Antwort4> createState() => _Antwort4State();
}

class _Antwort4State extends State<Antwort4> {
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
            'Ohhh nein mann das kann doch nicht sein nicht die hoffnung verlieren...',
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
