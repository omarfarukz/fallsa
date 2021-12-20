import 'package:fallsa/screens/Disclaimer/disclaimer_screen.dart';
import 'package:fallsa/screens/FallRiskTest//first_question.dart';
import 'package:fallsa/screens/FallRiskTest/first_attempt.dart';
import 'package:fallsa/screens/FallRiskTest/fall_risk_introduction.dart';
import 'package:fallsa/screens/FallRiskTest/report.dart';
import 'package:fallsa/screens/FallRiskTest/second_question.dart';
import 'package:fallsa/screens/FallRiskTest/test_result.dart';
import 'package:fallsa/screens/Guideline/guideline_screen.dart';
import 'package:fallsa/screens/PastResult/past_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fallsa/screens/home_screen.dart';
import 'package:fallsa/screens/Login/login_screen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: InitializerWidget(),

      // routes: {
      //     '/guidelines': (_) => GuidelinesScreen(),
      // },
    );
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth _auth;

  User _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? PastResultScreen()
            : LoginScreen();
  }
}
