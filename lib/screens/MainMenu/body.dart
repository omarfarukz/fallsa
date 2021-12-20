import 'package:fallsa/screens/Education/education_screen.dart';
import 'package:fallsa/screens/Education/education_video_screen_first.dart';
import 'package:fallsa/screens/FallRiskTest/first_question.dart';
import 'package:fallsa/screens/PastResult/past_result.dart';
import 'package:fallsa/screens/StrengthTest/strength_test_video_introduction.dart';
import 'package:fallsa/screens/StrengthTest/strength_test_screen.dart';
import 'package:fallsa/screens/StrengthTest/strength_test_video_introduction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'background.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController language = useTextEditingController();
    //final List<String> languages = ["Bhasa Melayu", "English"];
    final Size size = MediaQuery.of(context).size;
    final double iconHeight = 150;
    final double iconWeidth = 170;

    return Background(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              style:
                              TextStyle(fontSize: 25);
                            },
                            child: Text(
                              "ENG/",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.green[800]),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "BM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/menu_one.png",
                  height: size.height * 0.25,
                ),
                Text(
                  "Main Menu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.green[900]),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 40,
                  endIndent: 40,
                  height: 10,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.95,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: ,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PastResultScreen()));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        height: 150,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.green[300]),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.history,
                                              color: Colors.black,
                                              size: 110.0,
                                            ),
                                            Text(
                                              "Past Test Result",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FirstQuestion(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        height: 150,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.green[300]),
                                        child: Column(
                                          children: [
                                        Image.asset(
                                          "assets/icons/gg-removebg-preview.png",
                                          width: 125,
                                        ),
                                            Text(
                                              "Fall Risk Test",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: size.width * 0.95,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: ,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StrengthTestIntroduction(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        height: 150,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.green[300]),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "assets/icons/logo_exercise.png",
                                              width: 110,
                                            ),
                                            Text(
                                              "Strength Test",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EducationVideoScreenFirst(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        height: 150,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.green[300]),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.menu_book_outlined,
                                              color: Colors.black,
                                              size: 110.0,
                                            ),
                                            Text(
                                              "Education",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
