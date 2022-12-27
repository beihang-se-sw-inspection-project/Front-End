import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/RoundInput.dart';
import 'package:report_app/Model/create_report_req.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';
import '../Model/update_task_req.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/error_throwable.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class CreateReport extends StatefulWidget {
  final String taskId;

  const CreateReport({
    super.key,
    required this.taskId,
  });

  _createReport createState() => _createReport(
        taskId,
      );
}

class _createReport extends State<CreateReport> {
  final TextEditingController statusController = TextEditingController();
  final TextEditingController taskReportController = TextEditingController();
  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();
  final String taskId;

  _createReport(
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
          taskReportController.text,
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
          "Create Project",
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
                child: SvgPicture.asset("asset/image/report_icon.svg"),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Inspection",
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
                        "report the task is it correct or still \nhave bug",
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
                        'Approve',
                        'Bug',
                      ],
                      onChanged: (value) {
                        statusController.text = value;
                      },
                    ),
                    RoundInput(
                      hintText: "Report",
                      controller: taskReportController,
                      onChanged: (val) {},
                      type: TextInputType.multiline,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      text: 'Submit',
                      press: () async {
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
