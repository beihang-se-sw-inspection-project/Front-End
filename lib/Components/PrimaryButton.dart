import 'package:flutter/material.dart';

import 'Constant.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final Color borderColor;
  final double? width;

  PrimaryButton({
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.borderColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : MediaQuery.of(context).size.width * .7,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: color,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 18.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(color: borderColor)),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
