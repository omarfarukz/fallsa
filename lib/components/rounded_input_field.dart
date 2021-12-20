import 'package:flutter/material.dart';
import 'package:fallsa/components/text_field_container.dart';
import 'package:fallsa/constants.dart';

enum InputFieldType {
  phone,
  email,
  age,
  address1,
  address2,
  number,
  states,
  password,
  regular,
  url
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final InputFieldType inputType;

  const RoundedInputField(
    this.controller, {
    Key key,
    this.hintText,
    this.icon,
    this.inputType = InputFieldType.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        enabled: true,
        controller: controller,
        validator: _validator,
        cursorColor: Colors.black,
        obscureText: inputType == InputFieldType.password,
        style: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
        ),
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.fromLTRB(-35, 0, 0, 0),
          errorMaxLines: 3,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  String _validator(String text) {
    if (text == null || text.isEmpty) {
      return 'field cannot be empty';
    } else {
      switch (inputType) {
        case InputFieldType.phone:
          final RegExp regExp =
              RegExp(r"((\+)|(00))?[0-9\(][\s\-\)0-9][^\n]{6,15}[0-9]");
          return !regExp.hasMatch(text) ? 'wrong phone number' : null;
        case InputFieldType.email:
          final RegExp regExp = RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
          return !regExp.hasMatch(text) ? 'wrong email format' : null;

        case InputFieldType.number:
          return double.tryParse(text) == null
              ? "Only numbers are allowed"
              : null;
        case InputFieldType.password:
          final RegExp regExp =
              RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$");
          return !regExp.hasMatch(text)
              ? 'Password needs to be minimum 8 character including uppercase and special character'
              : null;
        case InputFieldType.regular:
          return null;
        case InputFieldType.url:
          final RegExp regExp = RegExp(
              r"\b(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/\S*)?\b\/?");
          return !regExp.hasMatch(text) ? 'Invalid uld' : null;
      }
    }
  }
}
