import 'package:flutter/material.dart';
import 'package:mood_calendar/Home.dart';
import 'package:mood_calendar/components/test.dart';
import 'package:mood_calendar/question_pages/Question_i.dart';
import 'package:rive/rive.dart';

class MyButton extends StatefulWidget {
  final Function changeButton;
  MyButton({required this.changeButton});
  // const MyButton({
  //   Key? key,
  //   r ({this.ausgabe1}),
  // }) : super(key: key);
  @override
  _ButtonState createState() => _ButtonState();
}

// class Ausgabe extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return (Text('hi'));
//   }
// }

class _ButtonState extends State<MyButton> {
  //controller
  bool ausgabe1 = false;
  bool button = false;

  final MaterialStatesController _newinput = MaterialStatesController();

  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(29));
  @override
  _changeButton() {
    setState(() {
      button = true;
      ausgabe1 = true;
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 60, 17, 80),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 350,
        height: 45,
        child: button
            //!true Value!//
            ? ElevatedButton(
                statesController: _newinput,
                child: const Text(
                  'Wie war dein Tag so?',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.3,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints(
                              maxHeight: 300, maxWidth: 400),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 70, 11, 87),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(322, 40),
                                      shape: shape,
                                    ),
                                    child: const Text(
                                      "Mein Tag war Wunderbar",
                                    ),
                                    onPressed: () => setState(() {
                                          ausgabe1 = true;
                                          Navigator.pop(context);
                                        })),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Joa er war gut könnte aber besser sein",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Mein Tag war nicht wirklich gut",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Mein Tag war einfach nur schlecht...",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                    ),
                                    child: FloatingActionButton.small(
                                      onPressed: (() =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()))),
                                      child: const Icon(Icons.home),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            //!FalseValue!//
            : ElevatedButton(
                statesController: _newinput,
                child: const Text(
                  'Wie gehts dir Heute so ?',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.3,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          constraints: const BoxConstraints(
                              maxHeight: 300, maxWidth: 400),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 70, 11, 87),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Es geht mir Wunderbar",
                                  ),
                                  onPressed: _changeButton,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Es geht mir Gut aber es könnte besser sein",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Joa nicht wirklich",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(322, 40),
                                    shape: shape,
                                  ),
                                  child: const Text(
                                    "Nein heute gehts mir wirklich beschissen...",
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
