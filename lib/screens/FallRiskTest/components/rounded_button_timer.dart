import 'package:flutter/material.dart';
import 'package:fallsa/constants.dart';

class RoundedButtonTimer extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButtonTimer({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.fromLTRB(65, 15, 65, 15),
          color: Colors.green[400],
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
