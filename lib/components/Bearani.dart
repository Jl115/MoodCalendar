import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Bearani extends StatefulWidget {
  const Bearani({super.key});

  @override
  State<Bearani> createState() => _BearaniState();
}

class _BearaniState extends State<Bearani> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                      height: 100,
                      width: 100,
                      child: RiveAnimation.asset(
                        'images/bear.riv',
                        fit: BoxFit.fill,
                      ),
                    );
  }
}