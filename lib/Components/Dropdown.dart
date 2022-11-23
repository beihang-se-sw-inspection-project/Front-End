import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  var _value;
  final String hintText;
  final List item;

  DropDown({
    super.key,
    required this.hintText,
    required this.item,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: _value,
        hint: Text(
          hintText,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
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
        onChanged: (value) {},
      ),
    );
  }
}
