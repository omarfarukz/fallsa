import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/FallRiskTest/components/rounded_button_timer.dart';
import 'package:fallsa/screens/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/FallRiskTest/second_question.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:fallsa/screens/MainMenu/nav.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ElapsedTime {
  final int hundreds;
  final int seconds;
  final int minutes;

  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
  });
}

class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(
      fontSize: 50.0, fontFamily: "Bebas Neue", color: Colors.black);
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}

class ReportST extends StatefulWidget {
  ReportST({Key key}) : super(key: key);

  ReportState createState() => new ReportState();
}

class ReportState extends State<ReportST> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];
  void _onItemTapped(int index) {
    if (_selectedIndex == 0) {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavScreen(),
        ),
      );
    }
  }
  final Dependencies dependencies = new Dependencies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            title: Text(
              "Main Menu",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.black),
            title: Text(
              "Report",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Report',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(
                    "assets/progressbar/hundred.png",
                    width: 130,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Strength Test Score: ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 20, 120, 0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 45.0, right: 45.0),
                  labelText: "Score:",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 10.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
              child: Center(
                child: Text(
                  'Your personal physical performance test result comparing with population norms',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/images/sample_graph.png",
              height: 270,
            ),
            SizedBox(width: 0),
          ],
        ),
      ),
    );
  }
}