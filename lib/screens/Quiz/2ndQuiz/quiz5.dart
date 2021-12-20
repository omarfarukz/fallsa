import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Quiz/2ndQuiz/quiz6.dart';
import 'package:fallsa/screens/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz5Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final answer3;
  // final answer4;
  final correctAnswer;
  // final int wrongAnswer;
  final quiz1Score;
  const Quiz5Screen(
      {Key key,
      // this.answer1,
      // this.answer2,
      // this.answer3,
      // this.answer4,
      // this.wrongAnswer,
      this.quiz1Score,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz5ScreenState createState() => _Quiz5ScreenState();
}

class _Quiz5ScreenState extends State<Quiz5Screen> {
  @override
  Widget build(BuildContext context) {
    User user;
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    String answer5;

    screen6() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      print(correctAnswer);
      // print(wrongAnswer);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz6Screen(
              // answer1: widget.answer1,
              // answer2: widget.answer2,
              // answer3: widget.answer3,
              // answer4: answer4,
              correctAnswer: correctAnswer,
              quiz1Score: widget.quiz1Score,
              // wrongAnswer: wrongAnswer,
            );
          },
        ),
      );
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
                          "Quiz 5",
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
                            "What do you do if you feel dizzy when standing up in the morning?",
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
                              text: 'Stay in bed.There is no need to get up',
                              function: () {
                                answer5 =
                                    'Stay in bed.There is no need to get up';
                                _isSelected = true;
                                screen6();
                              },
                            ),
                            QuizButtton(
                              text:
                                  'Sit up in the bed for a few minutes before standing up. Stand up for a minute before walking',
                              function: () {
                                answer5 =
                                    'Sit up in the bed for a few minutes before standing up. Stand up for a minute before walking';
                                screen6();
                              },
                            ),
                            QuizButtton(
                              text: 'Its common, do nothing about it',
                              function: () {
                                answer5 = 'Its common, do nothing about it';
                                _isSelected = true;
                                screen6();
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
