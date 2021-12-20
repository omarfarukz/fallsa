import 'package:flutter/material.dart';
import 'package:fallsa/components/text_field_container.dart';
import 'package:fallsa/constants.dart';

enum STInputFieldType {
  phone,
  email,
  age,
  address1,
  address2,
  number,
  states,
  password,
  regular,
  url,
  score,
}

class STRoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final STInputFieldType inputType;

  const STRoundedInputField(
    this.controller, {
    Key key,
    this.hintText,
    this.icon,
    this.inputType = STInputFieldType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        enabled: true,
        controller: controller,
        cursorColor: Colors.black,
        obscureText: inputType == STInputFieldType.password,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.fromLTRB(-35, 0, 0, 0),
          errorMaxLines: 5,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

}
