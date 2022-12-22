import 'package:flutter/material.dart';
import 'package:report_app/Components/Constant.dart';
import 'package:report_app/Components/ProjectRoundCard.dart';
import 'package:report_app/Screen/CreateTask.dart';

import 'ProjectDetail.dart';

class HomeScreen extends StatelessWidget {
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
                    "Project",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ProjectRoundCard(
                    title: "Login",
                    description: "task: 1",
                    date: "1/11/2022",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetail()),
                      );
                    }),
                ProjectRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                ),
                ProjectRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                ),
                ProjectRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                ),
                ProjectRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                ),
                ProjectRoundCard(
                  title: "Login",
                  description: "task: 1",
                  date: "1/11/2022",
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTask(),
            ),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
