import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';
import 'TextFieldContainer.dart';

class DateInput extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLine;
  final Color color;
  final VoidCallback onPress;

  const DateInput({
    super.key,
    required this.controller,
    this.maxLine,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: TextStyle(color: color, fontSize: 14),
        maxLines: maxLine,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.calendar_today_rounded,
            color: kPrimaryColor,
          ),
          labelText: "Select date"
        ),
        onTap: onPress,
      ),
    );
  }
}
