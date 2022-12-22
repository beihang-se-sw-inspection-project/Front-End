import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  var _value;
  final String hintText;
  final List item;
  final ValueChanged onChanged;
  DropDown({
    super.key,
    required this.hintText,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 10;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth,
        vertical: 10.0,
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              style: BorderStyle.none,
              color: Colors.white,
            ),
          ),
        ),
        value: _value,
        hint: Text(
          hintText,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        items: item.map((valueItem) {
          return DropdownMenuItem(
            child: Text(
              valueItem,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            value: valueItem,
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
