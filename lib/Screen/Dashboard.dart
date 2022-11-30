import 'package:flutter/material.dart';
import 'package:report_app/Components/TaskRoundButton.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 24.0,
                  ),
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TaskRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                  status: 'To Do',
                ),
                TaskRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                  status: 'To Do',
                ),
                TaskRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                  status: 'To Do',
                ),
                TaskRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                  status: 'To Do',
                ),
                TaskRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                  status: 'To Do',
                ),
                TaskRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                  status: 'To Do',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
