import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/DateInput.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/RoundInput.dart';
import 'package:report_app/Model/create_task_req.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';
import '../Model/user_model_list.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/error_throwable.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class CreateTask extends StatefulWidget {
  final String projectId;
  final String project_manager;
  final String inspector;

  const CreateTask({
    super.key,
    required this.projectId,
    required this.project_manager,
    required this.inspector,
  });

  _createTask createState() =>
      _createTask(projectId, project_manager, inspector);
}

class _createTask extends State<CreateTask> {
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController taskDetailController = TextEditingController();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController assigneeController = TextEditingController();

  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();
  final String projectId;
  final String projectManager;
  final String inspector;

  _createTask(
    this.projectId,
    this.projectManager,
    this.inspector,
  );

  void createTask(context) async {
    final createTask = CreateTaskReq(
      CreateTaskDataReq(
        'tasks',
        CreateTaskDataAttrReq(
          projectId,
          taskTitleController.text,
          "To Do",
          deadlineController.text,
          priorityController.text,
          taskDetailController.text,
          assigneeController.text,
          projectManager,
          "task",
          inspector,
        ),
      ),
    );
    final caller = _apiService.createTask(createTask);
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

  Future<UserModelList> getUsers() {
    final caller = _apiService.getUser();
    final callHelper = ApiCallHandler(caller);
    return callHelper.execute();
  }

  List<String> getUserNameListByRole(List<UserModelRes>? users, String role) {
    if (users == null) return [];
    return users
        .where((element) =>
            element.attributes.role.toLowerCase() == role.toLowerCase())
        .map((item) => item.attributes.name)
        .toList();
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
      body: FutureBuilder<UserModelList>(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot<UserModelList> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final developer =
                getUserNameListByRole(snapshot.data!.data, 'Developer');
            return SingleChildScrollView(
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
                              "Create your tasks",
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
                              "Set the status of your task",
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
                          RoundInput(
                            hintText: "Title",
                            controller: taskTitleController,
                            onChanged: (val) {},
                            type: TextInputType.text,
                            color: Colors.black,
                          ),
                          DateInput(
                            controller: deadlineController,
                            color: Colors.black,
                            onPress: () async {
                              DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickeddate != null) {
                                setState(
                                  () {
                                    deadlineController.text =
                                        DateFormat('yyyy/MM/dd')
                                            .format(pickeddate);
                                  },
                                );
                              }
                            },
                          ),
                          DropDown(
                            hintText: "Assignee",
                            item: developer,
                            onChanged: (value) {
                              assigneeController.text = value;
                            },
                          ),
                          DropDown(
                            hintText: "Priority",
                            item: [
                              'High',
                              'Low',
                              'Medium',
                            ],
                            onChanged: (value) {
                              priorityController.text = value;
                            },
                          ),
                          RoundInput(
                            hintText: "Task Detail",
                            controller: taskDetailController,
                            onChanged: (val) {},
                            type: TextInputType.multiline,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          PrimaryButton(
                            text: 'Submit',
                            press: () {
                              createTask(context);
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
