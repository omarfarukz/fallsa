import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz3.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz7.dart';
import 'package:fallsa/screens/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz6Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final answer3;
  // final answer4;
  // final answer5;
  final correctAnswer;
  // final wrongAnswer;

  const Quiz6Screen(
      {Key key,
      // this.answer1,
      // this.answer2,
      // this.answer3,
      // this.answer4,
      // this.answer5,
      // this.wrongAnswer,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz6ScreenState createState() => _Quiz6ScreenState();
}

class _Quiz6ScreenState extends State<Quiz6Screen> {
  @override
  Widget build(BuildContext context) {
    User user;
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    String answer6;
    _showdialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Oh It\'s Wrong!The correct answer is:'),
          content: Text('Install grab bars in the bathroom'),
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

    screen7() {
      if (answer6 == 'Install grab bars in the bathroom') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz7Screen(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: widget.answer3,
                // answer4: widget.answer4,
                // answer5: widget.answer5,
                // answer6: answer6,
                correctAnswer: correctAnswer,
                // wongAnswer: wrongAnswer,
              );
            },
          ),
        );
      } else if (answer6 == 'Move to a new house') {
        _showdialog();
      } else if (answer6 == 'Use a doormat') {
        _showdialog();
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
                          "Quiz 6",
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
                            "Which of the following simple action can help you lower risk of falling in the bathroom?",
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
                              text: 'Install grab bars in the bathroom',
                              function: () {
                                answer6 = 'Install grab bars in the bathroom';
                                screen7();
                              },
                            ),
                            QuizButtton(
                              text: 'Move to a new house',
                              function: () {
                                answer6 = 'Move to a new house';
                                _isSelected = true;
                                screen7();
                              },
                            ),
                            QuizButtton(
                              text: 'Use a doormat',
                              function: () {
                                answer6 = 'Use a doormat';
                                _isSelected = true;
                                screen7();
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
