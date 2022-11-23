import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:report_app/Components/Constant.dart';

import 'TextFieldContainer.dart';

class PasswordInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onPress;
  final TextEditingController controller;
  final String? hideText;
  const PasswordInputField({
    required this.onChanged,
    required this.onPress,
    required this.controller,
    this.hideText,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        cursorColor: kPrimaryColor,
        style: TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hideText,//LocaleKeys.password.tr(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
