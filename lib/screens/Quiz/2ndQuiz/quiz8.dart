import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/MainMenu/nav.dart';
import 'package:fallsa/screens/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz8Screen extends StatefulWidget {
  final quiz1Score;
  final correctAnswer;

  const Quiz8Screen({Key key, this.quiz1Score, this.correctAnswer})
      : super(key: key);

  @override
  _Quiz8ScreenState createState() => _Quiz8ScreenState();
}

class _Quiz8ScreenState extends State<Quiz8Screen> {
  @override
  Widget build(BuildContext context) {
    User user;
    bool _isSelected = false;
    int correctAnswer = widget.correctAnswer;
    int quiz1Score = widget.quiz1Score;
    int wrongAnswer = 0;
    String answer8;
    CollectionReference quiz2 = FirebaseFirestore.instance.collection('quiz2');
    _showdialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('The Pre Quiz Score is: $quiz1Score'),
          content: Text('The Post Quiz Score is: $correctAnswer'),
          actions: [
            FlatButton(
                color: Colors.green[400],
                onPressed: () {
                  quiz2
                      .doc()
                      .set({
                        'postquiz': 'postQuiz',
                        'correct': correctAnswer,
                        'wrong': wrongAnswer,
                      })
                      .then((value) => print("User Data added"))
                      .catchError(
                          (onError) => print('Failed to add. $onError'));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NavScreen();
                      },
                    ),
                  );
                },
                child: Text('Go to Main Screen'))
          ],
        ),
      );
    }

    navScreen() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      wrongAnswer = 8 - correctAnswer;
      _showdialog();
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
                          "Quiz 8",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
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
                            "What can help prevent falls in older persons?",
                            style: TextStyle(
                              fontSize: 22,
                              //fontFamily: 'Raleway',
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
                              text: 'Staying at home',
                              function: () {
                                answer8 = 'Staying at home';
                                _isSelected = true;
                                navScreen();
                              },
                            ),
                            QuizButtton(
                              text: 'Exercising regularly',
                              function: () {
                                answer8 = 'Exercising regularly';
                                navScreen();
                              },
                            ),
                            QuizButtton(
                              text: 'Avoiding movements and physical activity',
                              function: () {
                                answer8 =
                                    'Avoiding movements and physical activity';
                                _isSelected = true;
                                navScreen();
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
