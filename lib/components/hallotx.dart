import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class Hallotx extends StatefulWidget {
  const Hallotx({super.key});

  @override
  State<Hallotx> createState() => _HallotxState();
}

class _HallotxState extends State<Hallotx> {
  bool? ausgabe1 = false;
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
                'Hallo ich bin dein \npersönnlicher\nAssistent',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.3,
                  fontSize: 20,
                ),
              ),
              duration: Duration(milliseconds: 130),
            )));
  }
}
