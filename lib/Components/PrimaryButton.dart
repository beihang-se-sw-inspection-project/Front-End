import 'package:flutter/material.dart';

import 'Constant.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final Color borderColor;

  PrimaryButton({
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 4;
    return Container(
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: color,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth,
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
