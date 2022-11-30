import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report_app/Components/Constant.dart';

class TaskRoundCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String status;

  const TaskRoundCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                description,
                style: TextStyle(
                  color: Colors.grey,

                  fontSize: 14,
                ),
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
    );
  }
}
