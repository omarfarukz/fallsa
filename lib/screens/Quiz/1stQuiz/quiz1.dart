import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz2.dart';
import 'package:fallsa/screens/Quiz/components/quizbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Quiz1Screen extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);

  @override
  _Quiz1ScreenState createState() => _Quiz1ScreenState();
}

class _Quiz1ScreenState extends State<Quiz1Screen> {
  User user;

  String answer1;
  String condition;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int count = 0;
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('userDetails').snapshots();

  @override
  _showdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Oh It\'s Wrong!The correct answer is:'),
        content: Text('True'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Center(child: Text("Ok")),
          ),
        ],
      ),
    );
  }

  bool _isSelected = false;

  screen2() {
    if (answer1 == 'True') {
      if (!_isSelected == true) {
        correctAnswer = correctAnswer + 1;
      }
      print(correctAnswer);
      // print(wrongAnswer);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz2Screen(
              // answer1,
              correctAnswer,
            );
          },
        ),
      );
    } else if (answer1 == 'False' || answer1 == 'Don\'t Know') {
      _showdialog();
    }
  }

  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    CollectionReference data =
        FirebaseFirestore.instance.collection('userDetails');
    DocumentReference docReference = data.doc(user.uid);

    getData() {
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc["name"]);
          String updatedData = doc["gander"];
          print(updatedData);
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        // margin: EdgeInsets.all(120),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/green_top.png",
                width: 200,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 240,
              child: Image.asset(
                "assets/images/green_bottom.png",
                width: 180,
              ),
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Quiz 1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                            //fontFamily: 'Raleway',
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Falls are a normal part of ageing and are not preventable. ?",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ElevatedButton(
                            //   child: Text('True'),
                            //   onPressed: () {},
                            // ),
                            QuizButtton(
                              text: 'True',
                              function: () {
                                answer1 = 'True';
                                condition = 'true';

                                screen2();
                              },
                            ),
                            // ElevatedButton(
                            //   child: Text('False'),
                            //   onPressed: () {

                            //   },
                            // ),
                            QuizButtton(
                              text: 'False',
                              function: () {
                                answer1 = 'False';
                                _isSelected = true;

                                screen2();
                              },
                            ),
                            // ElevatedButton(
                            //   child: Text('Don\'t Know'),
                            //   onPressed: () {
                            //     answer1 = 'Don\'t Know';
                            //     _isSelected = true;
                            //     screen2();
                            //   },
                            // ),
                            QuizButtton(
                              text: 'Don\'t Know',
                              function: () {
                                answer1 = 'Don\'t Know';
                                _isSelected = true;
                                screen2();
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: getData, child: Text('Get Data'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
