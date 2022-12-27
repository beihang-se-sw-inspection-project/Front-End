import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/DateInput.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/RoundInput.dart';
import 'package:report_app/Model/create_task_req.dart';
import 'package:report_app/Model/update_task_req.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/error_throwable.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class UpdateStatus extends StatefulWidget {
  final String projectId;
  final String taskId;

  const UpdateStatus({
    super.key,
    required this.projectId,
    required this.taskId,
  });

  _updateStatus createState() => _updateStatus(projectId, taskId);
}

class _updateStatus extends State<UpdateStatus> {
  final TextEditingController statusController = TextEditingController();

  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();
  final String projectId;
  final String taskId;

  _updateStatus(
    this.projectId,
    this.taskId,
  );

  void updateTask(context) async {
    final updateTask = UpdateTaskReq(
      UpdateTaskDataReq(
        'tasks',
        taskId,
        UpdateTaskDataAttrReq(
          taskId,
          statusController.text,
          "task",
        ),
      ),
    );
    print("WHAT $taskId");
    final caller = _apiService.updateTask(taskId, updateTask);
    final callHelper = ApiCallHandler(caller);
    try {
      final response = await callHelper.execute();
      Navigator.pop(context);
    } catch (e) {
      if (e is ErrorThrowable) {
        debugPrint("ERROR ${e.message}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Update your Status",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: inputBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset("asset/image/task_icon.svg"),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Update your task",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "Update your Status by task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    DropDown(
                      hintText: "Status",
                      item: [
                        'Complete',
                        'In progress',
                        'To Do',
                      ],
                      onChanged: (value) {
                        statusController.text = value;
                      },
                    ),
                    PrimaryButton(
                      text: 'Submit',
                      press: () {
                        updateTask(context);
                      },
                      color: kPrimaryColor,
                      textColor: inputBackgroundColor,
                      borderColor: kPrimaryColor,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
