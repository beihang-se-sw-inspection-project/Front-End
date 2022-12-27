import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report_app/Components/Constant.dart';

class TaskRoundCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String status;
  final VoidCallback? onPress;

  const TaskRoundCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Detail: $description",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
