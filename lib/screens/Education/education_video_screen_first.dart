import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Disclaimer/components/background.dart';
import 'package:fallsa/screens/Disclaimer/disclaimer_screen.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz1.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EducationVideoScreenFirst extends StatefulWidget {
  @override
  _EducationVideoScreen createState() => _EducationVideoScreen();
}

class _EducationVideoScreen extends State<EducationVideoScreenFirst> {
  youTube(context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 210, 0),
                        child: Image.asset(
                          "assets/images/green_top.png",
                          width: 180,
                        ),
                      ),
                      Text(
                        "Educations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 5,
                        indent: 15,
                        endIndent: 15,
                      ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "FallSA (Falls Screening Application) offers seniors a tool self-examination to inform fall risk based studies conducted in Malaysia. This app has the potential to create awareness among seniors about the importance of early risk screening falls so as to assist in the process of early treatment and prevention. The data in this mobile application will handled as medical records as set forth in Data Protection Disclaimer and Laws of Malaysia ACT 709; Personal Data Protection Act 2010. The mobile app only notifies the risk of a fall and does not make a diagnosis or suggest dose changes current medicine.",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),

                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(30),
                      //   child: player,
                      // ),

                      RoundedButton(
                        text: "Next",
                        press: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Quiz1Screen();
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(220, 0, 0, 0),
                        child: Image.asset(
                          "assets/images/green_bottom.png",
                          width: 180,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: youTube(context),
      ),
    );
  }
}
