import 'package:fallsa/screens/Guideline/guideline_screen.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:fallsa/screens/PersonalDetails/personal_details_screen.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _NavScreen createState() => _NavScreen();
}

class _NavScreen extends State<NavScreen> {
  int _currrentIndex = 1;
  final pages = [
    GuidelineScreen(),
    MenuScreen(),
    PersonalDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
     backgroundColor: Colors.green[400],
        currentIndex: _currrentIndex,
        onTap: (index) => setState(() => _currrentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.integration_instructions, color: Colors.black),
            title: Text(
              "Instruction",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            title: Text(
              "Main Menu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}
