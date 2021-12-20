import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz3.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz5.dart';
import 'package:fallsa/screens/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz4Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final int wrongAnswer;
  final correctAnswer;

  const Quiz4Screen(
      {Key key,
      // this.answer1,
      // this.answer2,
      // this.wrongAnswer,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz4ScreenState createState() => _Quiz4ScreenState();
}

class _Quiz4ScreenState extends State<Quiz4Screen> {
  @override
  Widget build(BuildContext context) {
    String answer4;
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    _showdialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Oh It\'s Wrong!The correct answer is:'),
          content: Text('Yes'),
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

    screen5() {
      if (answer4 == 'Yes') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz5Screen(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: widget.answer3,
                // answer4: answer4,
                // wrongAnswer: wrongAnswer,
                correctAnswer: correctAnswer,
              );
            },
          ),
        );
      } else if (answer4 == 'No') {
        _showdialog();
        // if (_2isSelected == false) {
        //   wrongAnswer++;
        // }
      } else if (answer4 == 'Don\'t Know') {
        _showdialog();
        // if (_1isSelected == false) {
        //   wrongAnswer++;
        // }
      }
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
                      children: [
                        Text(
                          "Quiz 4",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                            // fontFamily: 'Raleway',
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
                            "Can the use of appropriate walking aids decrease the risk for falls in older persons??",
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
                            QuizButtton(
                              text: 'Yes',
                              function: () {
                                answer4 = 'Yes';
                                screen5();
                              },
                            ),
                            QuizButtton(
                              text: 'No',
                              function: () {
                                answer4 = 'No';
                                _isSelected = true;
                                screen5();
                              },
                            ),
                            QuizButtton(
                              text: 'Don\'t Know',
                              function: () {
                                answer4 = 'Don\'t Know';
                                _isSelected = true;
                                screen5();
                              },
                            ),
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
