import 'package:fallsa/screens/Education/education_video_screen_first.dart';
import 'package:fallsa/screens/Guideline/guideline_screen.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:fallsa/screens/MainMenu/nav.dart';

import 'package:fallsa/screens/PersonalDetails/personal_details_screen.dart';
import 'package:flutter/material.dart';

class NavEducationScreen extends StatefulWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _NavEducationScreen createState() => _NavEducationScreen();
}

class _NavEducationScreen extends State<NavEducationScreen> {
  int _currrentIndex = 0;
  final pages = [
    EducationVideoScreenFirst(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: pages[_currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightGreen[900],
        backgroundColor: Colors.lightGreen[50],
        currentIndex: _currrentIndex,
        onTap: (index) => setState(() => _currrentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education_sharp),
            title: Text(
              "Education",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
