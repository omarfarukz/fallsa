import 'dart:math' as math;

import 'package:fallsa/components/rounded_input_field.dart';
import 'package:fallsa/screens/PastResult/past_result.dart';
import 'package:fallsa/screens/StrengthTest/report_strength_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'components/strength_test_rounded_input_field.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountDownTimer(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.red,
      ),
    );
  }
}

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  TextEditingController get score => null;
  bool donetest = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightGreen[50],
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 550, 1, 1),


                    child: Container( child: donetest ? Column(
                        children: [
                          Container(
                            child: Container(child: controller.isAnimating ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Please start counting the number of seat and stand.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                ), textAlign: TextAlign.center,),
                            ):  STRoundedInputField(
                              score,
                              hintText: "Number of seat and stand",
                              inputType: STInputFieldType.score,
                            ),
                            ),
                            ),
                          SizedBox(height: 50),

                          Container( child: controller.isAnimating ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ), textAlign: TextAlign.center,),
                          ): ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ReportST();
                                    },
                                  ),
                                );
                              },
                              child: Text("Submit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                  ),
                                  primary: Colors.green[400],
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,)),
                            ),
                          ),
                        ],
                      ): Text("Press start to start the test.",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 100, 8, 8),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.topCenter,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                        animation: controller,
                                        backgroundColor: Colors.white,
                                        color: themeData.indicatorColor,
                                      )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 80.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      AnimatedBuilder(
                                          animation: controller,
                                          builder: (context, child) {
                                            return FloatingActionButton.extended(
                                                onPressed: () {
                                                  donetest = true;
                                                  // if (controller.isAnimating)
                                                  //   // controller.stop();
                                                  // else {
                                                  controller.reverse(
                                                      from: controller.value == 0.0
                                                          ? 1.0
                                                          : controller.value);
                                                  // }
                                                },
                                                backgroundColor: Colors.green[400],
                                                icon: Icon(controller.isAnimating
                                                    ? Icons.access_time_outlined
                                                    : Icons.play_arrow, color: Colors.black, size: 50.0, ),
                                                label: Text(
                                                  controller.isAnimating ? "Started" : "Start",
                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),);
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = Colors.green[300];
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}