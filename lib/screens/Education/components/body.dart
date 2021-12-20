import 'package:fallsa/screens/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:fallsa/screens/MainMenu/nav.dart';
import 'package:fallsa/screens/Quiz/1stQuiz/quiz1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    openurl() {
      String urll = "https://youtu.be/x4Tc0s5gxBg";
      launch(urll);
    }

    return Background(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  Text(
                    "EducationTESt",
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
                  Container(
                    child: SingleChildScrollView(
                      child: Text(
                        "FallSA (Falls Screening Application) offers seniors a tool self-examination to inform fall risk based studies conducted in Malaysia. This app has the potential to create awareness among seniors about the importance of early risk screening falls so as to assist in the process of early treatment and prevention. The data in this mobile application will handled as medical records as set forth in Data Protection Disclaimer and Laws of Malaysia ACT 709; Personal Data Protection Act 2010. The mobile app only notifies the risk of a fall and does not make a diagnosis or suggest dose changes current medicine",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      openurl();
                    },
                    icon: Icon(
                      Icons.video_library,
                    ),
                    label: Text("Video Links"),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      primary: Colors.green[700],
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Quiz1Screen();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.skip_next,
                    ),
                    label: Text("Next"),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      primary: Colors.green[700],
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
