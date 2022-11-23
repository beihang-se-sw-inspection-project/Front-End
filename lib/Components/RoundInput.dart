import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';
import 'TextFieldContainer.dart';

class RoundInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType type;
  final int? maxLine;
  final Color color;

  const RoundInput({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.type,
    this.maxLine,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: TextStyle(color: color,fontSize: 14),
        keyboardType: type,
        onChanged: onChanged,
        maxLines: maxLine,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
