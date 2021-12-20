import 'package:fallsa/screens/Education/components/body.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  // const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightGreen[50],
        body: Body(),
      ),
    );
  }
}
