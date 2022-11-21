import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mood_calendar/screens/Notes.dart';
import 'package:mood_calendar/screens/Calendar.dart';

import 'package:mood_calendar/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final screens = [
    HomePage(),
    const Quotes(),
    const Notes(),
  ];
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
          body: screens[_selectedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 35,
              top: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black54,
              ),
              height: 80,
              child: GNav(
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade900.withOpacity(0.4),
                gap: 10,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 18,
                ),
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.edit_calendar_rounded,
                    text: 'Calendar',
                  ),
                  GButton(
                    icon: Icons.note_alt_outlined,
                    text: 'Notes',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) => setState(() => _selectedIndex = index),
              ),
            ),
          ),
        )
      ]);
}
