import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:report_app/Components/PrimaryButton.dart';
import 'package:report_app/Model/task_list_req.dart';
import 'package:report_app/Screen/CreateReport.dart';
import 'package:report_app/Screen/CreateTask.dart';
import 'package:report_app/Screen/UpdateStatus.dart';

import '../Components/Constant.dart';
import '../Model/project_list_req.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class TaskDetail extends StatelessWidget {
  final TaskDataAttrReq taskData;
  final TaskDataReq task;
  final SharePrefService sharePrefService = getIt.get();
  final ApiService _apiService = getIt.get();

  TaskDetail({super.key, required this.taskData, required this.task});

  Future<ProjectListReq> getProject() {
    final caller = _apiService.getProject();
    final callHelper = ApiCallHandler(caller);
    return callHelper.execute();
  }

  String getProjectNameById(List<ProjectDataReq>? projectId, String id) {
    if (projectId == null) return '';
    return projectId
        .where((element) => element.id == id)
        .toList()[0]
        .attributes
        .project_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Task Detail",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: inputBackgroundColor,
      ),
      body: FutureBuilder<ProjectListReq>(
        future: getProject(),
        builder:
            (BuildContext context, AsyncSnapshot<ProjectListReq> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final projectname =
                getProjectNameById(snapshot.data!.data, taskData.project_id);
            if (taskData.report != "task") {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/image/project_image.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 24.0,
                      ),
                      child: Text(
                        projectname,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "asset/image/date_icon.svg",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Deadline: ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            taskData.deadline,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "asset/image/priority_icon.svg",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Priority: ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            taskData.priority,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        "Task Detail",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        taskData.task_detail,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        "Report",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: Text(
                        taskData.report,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Center(
                      child: sharePrefService.getRole() == "inspector" &&
                              taskData.status == "Complete"
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: PrimaryButton(
                                width: MediaQuery.of(context).size.width * .9,
                                text: "Report",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateReport(
                                        taskId: task.id,
                                      ),
                                    ),
                                  );
                                },
                                color: kPrimaryColor,
                                textColor: Colors.white,
                                borderColor: inputBackgroundColor,
                              ),
                            )
                          : sharePrefService.getRole() == "developer" &&
                                  taskData.status != "Complete" &&
                                  taskData.status != "Approve"
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: PrimaryButton(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    text: "Update Status",
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateStatus(
                                            projectId: taskData.project_id,
                                            taskId: task.id,
                                          ),
                                        ),
                                      );
                                    },
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                    borderColor: inputBackgroundColor,
                                  ),
                                )
                              : null,
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'asset/image/project_image.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 24.0,
                    ),
                    child: Text(
                      projectname,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "asset/image/date_icon.svg",
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Deadline: ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          taskData.deadline,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "asset/image/priority_icon.svg",
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Priority: ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          taskData.priority,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      "Task Detail",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      taskData.task_detail,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Center(
                    child: sharePrefService.getRole() == "inspector" &&
                            taskData.status == "Complete"
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: PrimaryButton(
                              width: MediaQuery.of(context).size.width * .9,
                              text: "Report",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateReport(
                                      taskId: task.id,
                                    ),
                                  ),
                                );
                              },
                              color: kPrimaryColor,
                              textColor: Colors.white,
                              borderColor: inputBackgroundColor,
                            ),
                          )
                        : sharePrefService.getRole() == "developer" &&
                                taskData.status != "Complete" &&
                                taskData.status != "Approve"
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: PrimaryButton(
                                  width: MediaQuery.of(context).size.width * .9,
                                  text: "Update Status",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateStatus(
                                          projectId: taskData.project_id,
                                          taskId: task.id,
                                        ),
                                      ),
                                    );
                                  },
                                  color: kPrimaryColor,
                                  textColor: Colors.white,
                                  borderColor: inputBackgroundColor,
                                ),
                              )
                            : null,
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("There's an error!"));
          }
        },
      ),
    );
  }
}
