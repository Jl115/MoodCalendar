import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:mood_calendar/Home.dart';
import 'package:mood_calendar/components/Bearani.dart';
import 'package:mood_calendar/components/Button.dart';
import 'package:mood_calendar/antworten/antwort1.dart';
import 'package:mood_calendar/antworten/antwort2.dart';
import 'package:mood_calendar/antworten/antwort3.dart';
import 'package:mood_calendar/antworten/antwort4.dart';
import 'package:mood_calendar/components/hallotx.dart';
import 'package:mood_calendar/components/test.dart';
import 'package:mood_calendar/data/habit_database.dart';
import 'package:mood_calendar/screens/home_screen.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:mood_calendar/data/gefuehle_database.dart';

class Question extends StatefulWidget {
  Question({
    Key? key,
  }) : super(key: key);

  @override
  _QuestionState createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  final MaterialStatesController _newinput = MaterialStatesController();
//!         Gefühls_datenbank                   //!
  GefuehleDatabase db = GefuehleDatabase();
  final _myBox = Hive.box('Gefuehle_Database');
  void initState() {
    //check first time data
    if (_myBox.get('Gefuehle_Database') == null) {
      db.Gefuehle();
    }
    //not first time load data
    else {
      db.loadData();
    }
    // update data
    db.updateDatabase();

    super.initState();
  }

  int slectedIndex = 0;
  final screens = [
    Question(),
    const Home(),
  ];
//!booleans for button!//
  bool button = false;

//!____Functions Button State2____!//
  var press = '';
  _AmBesten() {
    Navigator.of(context).pop();
    setState(() {
      press = 'SehrGut';
      button = true;
    });
  }

  _GanzOke() {
    Navigator.of(context).pop();
    setState(() {
      // ausgabe2 = true;
      button = true;
      press = 'GanzOke';
    });
  }

  _EsGeht() {
    Navigator.of(context).pop();
    setState(() {
      // ausgabe2 = true;
      button = true;
      press = 'EsGeht';
    });
  }

  _schlecht() {
    Navigator.of(context).pop();
    setState(() {
      // ausgabe2 = true;
      button = true;
      press = 'schlecht';
    });
  }

//!_______________________________!//
//?____Functions Button State2____?//
  var tag = '';
  _SehrGuterTag() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
    setState(() {
      button = true;
      tag = 'SehrGut';
    });
  }

  _GuterTag() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
    setState(() {
      // ausgabe2 = true;
      button = true;
      tag = 'GanzOke';
    });
  }

  _GehtsoTag() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
    setState(() {
      // ausgabe2 = true;
      button = true;
      tag = 'EsGeht';
    });
  }

  _SchlechterTag() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
    setState(() {
      // ausgabe2 = true;
      button = true;
      tag = 'schlecht';
    });
  }

//?_______________________________?//

  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(29));

  @override
  Widget build(BuildContext context) => Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // | = x
                  mainAxisAlignment:
                      MainAxisAlignment.start, // |- sind für die X/y achse
                  mainAxisSize: MainAxisSize.min, // |

                  children: [
                    // ?welcome Text?//
                    if (press == '')
                      (const Hallotx())
                    else if (press == 'SehrGut')
                      (Antwort1())
                    else if (press == 'GanzOke')
                      (const Antwort2())
                    else if (press == 'EsGeht')
                      (Antwort3())
                    else if (press == 'schlecht')
                      (Antwort4()),
                    //?Bear Animation?//
                    const Bearani(),
                  ],
                ),
                const SizedBox(
                  width: 230,
                  height: 5,
                ),
                //?{Elevated Button with floating menu}\\
                Center(
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
                                        color: const Color.fromARGB(
                                            255, 70, 11, 87),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 30),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Mein Tag war Wunderbar",
                                              ),
                                              onPressed: _SehrGuterTag,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Joa er war gut könnte aber besser sein",
                                              ),
                                              onPressed: _GuterTag,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Mein Tag war nicht wirklich gut",
                                              ),
                                              onPressed: _GehtsoTag,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Mein Tag war einfach nur schlecht...",
                                              ),
                                              onPressed: _SchlechterTag,
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
                                        color: const Color.fromARGB(
                                            255, 70, 11, 87),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 30),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Es geht mir Wunderbar",
                                              ),
                                              onPressed: _AmBesten,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Es geht mir Gut aber es könnte besser sein",
                                              ),
                                              onPressed: _GanzOke,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Joa nicht wirklich",
                                              ),
                                              onPressed: _EsGeht,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size(322, 40),
                                                shape: shape,
                                              ),
                                              child: const Text(
                                                "Nein heute gehts mir wirklich beschissen...",
                                              ),
                                              onPressed: _schlecht,
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
                ),
              ],
            ),
          ),
        )
      ]);
}
