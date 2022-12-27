import 'package:flutter/material.dart';
import 'package:report_app/Components/TaskRoundButton.dart';
import 'package:report_app/Model/task_list_req.dart';
import 'package:report_app/Screen/TaskDetail.dart';

import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ApiService _apiService = getIt.get();

  final SharePrefService sharePrefService = getIt.get();

  Future<TaskListReq> getTaskList() {
    final caller = _apiService.getTask();
    final callHelper = ApiCallHandler(caller);
    return callHelper.execute();
  }

  List<TaskDataReq> getTaskListByStatus(List<TaskDataReq>? task) {
    if (task == null)
      return [];
    else if (sharePrefService.getRole() == "manager") {
      return task
          .where((element) =>
              element.attributes.status.toLowerCase() != 'complete' &&
              element.attributes.status.toLowerCase() != 'approve' &&
              element.attributes.project_manager ==
                  sharePrefService.getUsername())
          .map((item) => item)
          .toList();
    } else if (sharePrefService.getRole() == "developer") {
      return task
          .where((element) =>
              element.attributes.status.toLowerCase() != 'complete' &&
              element.attributes.status.toLowerCase() != 'approve' &&
              element.attributes.assignee == sharePrefService.getUsername())
          .map((item) => item)
          .toList();
    } else if (sharePrefService.getRole() == "inspector") {
      return task
          .where((element) =>
              element.attributes.status.toLowerCase() != 'complete' &&
              element.attributes.status.toLowerCase() != 'approve' &&
              element.attributes.inspector == sharePrefService.getUsername())
          .map((item) => item)
          .toList();
    }
    return task
        .where((element) =>
            element.attributes.status.toLowerCase() != 'complete' &&
            element.attributes.status.toLowerCase() != 'approve')
        .map((item) => item)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TaskListReq>(
        future: getTaskList(),
        builder: (BuildContext context, AsyncSnapshot<TaskListReq> snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            var tasks = getTaskListByStatus(snapShot.data!.data);
            return Column(
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
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      final res = await getTaskList();
                      tasks = getTaskListByStatus(res.data);
                      setState(() {});
                    },
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (_, index) {
                        final task = tasks[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TaskRoundCard(
                            title: task.attributes.title,
                            description: task.attributes.task_detail,
                            date: task.attributes.deadline,
                            status: task.attributes.status,
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TaskDetail(
                                    taskData: task.attributes,
                                    task: task,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
