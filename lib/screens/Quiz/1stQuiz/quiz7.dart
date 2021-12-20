import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz3.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz8.dart';
import 'package:fallsa/screens/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz7Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final answer3;
  // final answer4;
  // final answer5;
  // final answer6;
  // final int wongAnswer;
  final correctAnswer;

  const Quiz7Screen(
      {Key key,
      // this.answer1,
      // this.answer2,
      // this.answer3,
      // this.answer4,
      // this.answer5,
      // this.answer6,
      // this.wongAnswer,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz7ScreenState createState() => _Quiz7ScreenState();
}

class _Quiz7ScreenState extends State<Quiz7Screen> {
  @override
  Widget build(BuildContext context) {
    User user;
    var correctAnswer = widget.correctAnswer;
    // int wrongAnswer = widget.wongAnswer;
    String answer7;

    bool _isSelected = false;

    _showdialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Oh It\'s Wrong!The correct answer is:'),
          content: Text('Remove clutter permanently'),
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

    screen8() {
      if (answer7 == 'Remove clutter permanently') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz8Screen(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: widget.answer3,
                // answer4: widget.answer4,
                // answer5: widget.answer5,
                // answer6: widget.answer6,
                // answer7: answer7,
                // wrongAnswer: wrongAnswer,
                correctAnswer: correctAnswer,
              );
            },
          ),
        );
      } else if (answer7 == 'Turn sideways') {
        _showdialog();
        // if (_2isSelected == false) {
        //   wrongAnswer++;
        // }
      } else if (answer7 == 'Hop across it') {
        _showdialog();
        // if (_1isSelected == false) {
        //   wrongAnswer++;
        // }
      }
    }

    return Container(
      child: Scaffold(
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
                            "Quiz 7",
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
                              "To prevent falls when walking and avoiding clutter at home, you should",
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
                                text: 'Turn sideways',
                                function: () {
                                  answer7 = 'Turn sideways';
                                  _isSelected = true;
                                  screen8();
                                },
                              ),
                              QuizButtton(
                                text: 'Hop across it',
                                function: () {
                                  answer7 = 'Hop across it';
                                  _isSelected = true;
                                  screen8();
                                },
                              ),
                              QuizButtton(
                                text: 'Remove clutter permanently',
                                function: () {
                                  answer7 = 'Remove clutter permanently';
                                  screen8();
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
      ),
    );
  }
}
