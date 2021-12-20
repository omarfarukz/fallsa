import 'package:fallsa/screens/Education/education_screen.dart';
import 'package:fallsa/screens/PastResult/past_result.dart';
import 'package:fallsa/screens/PersonalDetails/personal_details_screen.dart';
import 'package:fallsa/screens/StrengthTest/strength_test_screen.dart';
import 'package:flutter/material.dart';
import '../MainMenu/body.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      // appBar: AppBar(
      //   elevation: 0.0,
      //   leading: BackButton(color: Colors.blue[900]),
      //   backgroundColor: Colors.lightBlue[700],
      // ),
      body: Body(),
    );
  }
}
