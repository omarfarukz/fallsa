import 'package:flutter/material.dart';
import 'package:fallsa/Screens/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Fallsa SignUp',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 33,
                color: Colors.black,
            ),
        ),
        leading: BackButton(
            color: Colors.black,
        ),

        backgroundColor: Colors.green[400],
      ),
      body: Body(),
    );
  }
}
