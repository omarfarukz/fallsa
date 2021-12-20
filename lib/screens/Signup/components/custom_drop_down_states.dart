import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomDropDownStates extends StatefulWidget {
  final List<String> options;
  final String title;
  final Color colors;
  final TextEditingController controller;
  const CustomDropDownStates(
      {Key key, this.options, this.title, this.colors, this.controller})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDownStates> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            // border: Border.all(color: Colors.purple[100]),
            borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),),
        child: DropdownButton<String>(
          hint: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              widget.controller.value == TextEditingValue.empty
                  ? widget.title
                  : widget.controller.text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
              ),
            ),
          ),
          style: Theme.of(context).primaryTextTheme.caption,
          underline: const SizedBox.shrink(),
          icon: Icon(Icons.arrow_drop_down, color: widget.colors),
          items: widget.options.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Row(
                children: <Widget>[
                  Text(
                    value,
                    style: const TextStyle(color: Colors.black, fontSize: 22,),
                  ),
                  // const Icon(
                  //   Icons.arrow_drop_down,
                  //   size: 25,
                  //   color: Colors.black,
                  // )
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.controller.text = value;
            });
          },
        ));
  }
}
