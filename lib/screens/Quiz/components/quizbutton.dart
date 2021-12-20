import 'package:flutter/material.dart';

class QuizButtton extends StatelessWidget {
  final String text;
  final Function function;
  const QuizButtton({
    this.text,
    this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              primary: Colors.green[400],
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
