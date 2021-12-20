import 'package:fallsa/screens/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/MainMenu/menue_screen.dart';
import 'package:fallsa/screens/MainMenu/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 8,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Disclaimer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
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
                  Container(
                    child: SingleChildScrollView(
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
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NavScreen();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.check_box_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Agree and Continue",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      primary: Colors.green[400],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
