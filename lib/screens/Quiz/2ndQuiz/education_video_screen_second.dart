import 'package:fallsa/components/rounded_button.dart';
import 'package:fallsa/screens/Quiz/2ndQuiz/quiz1.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EducationVideoScreenSecond extends StatefulWidget {
  //GuidelineScreen({Key? key}) : super(key: key);
  final url = "https://youtu.be/x4Tc0s5gxBg";
  final quiz1Score;

  const EducationVideoScreenSecond({Key key, this.quiz1Score})
      : super(key: key);

  @override
  _EducationVideoScreen createState() => _EducationVideoScreen();
}

class _EducationVideoScreen extends State<EducationVideoScreenSecond> {
  YoutubePlayerController _controller;
  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  youTube(context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Center(
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                  ),
                  builder: (context, player) {
                    return Container(
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Watch the following video to learn",
                              style: TextStyle(
                                //color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: player,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            text: "Next",
                            press: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Quiz1Screen(
                                      quiz1Score: widget.quiz1Score,
                                    );
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
                    );
                  },
                ),
              ),
            ),
          ),
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
