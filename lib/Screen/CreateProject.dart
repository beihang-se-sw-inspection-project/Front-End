import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/DateInput.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/RoundInput.dart';
import 'package:report_app/Model/create_project_req.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';
import '../Model/user_model_list.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../Service/error_throwable.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class CreateProject extends StatefulWidget {
  _createProject createState() => _createProject();
}

class _createProject extends State<CreateProject> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectManagerController =
      TextEditingController();
  final TextEditingController assigneeController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController toDoController = TextEditingController();
  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();

  void createProject(context) async {
    final createProject = CreateProjectReq(
      CreateProjectDataReq(
        'projects',
        CreateProjectDataAttrReq(
          projectNameController.text,
          projectManagerController.text,
          assigneeController.text,
          deadlineController.text,
          priorityController.text,
          overviewController.text,
          toDoController.text,
        ),
      ),
    );
    print("REQUEST ${jsonEncode(createProject.toJson())}");
    final caller = _apiService.createProject(createProject);
    final callHelper = ApiCallHandler(caller);
    try {
      final response = await callHelper.execute();
      Navigator.pop(context);
    } catch (e) {
      if (e is ErrorThrowable) {
        final snackBar = SnackBar(
          content: Text(e.errorRes?.getConcatError() ?? "System error"),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
    debugPrint("Header name: $role");
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
            final managers =
                getUserNameListByRole(snapshot.data!.data, 'Manager');
            final assignees =
                getUserNameListByRole(snapshot.data!.data, 'inspector');
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                          "asset/image/create_project_icon.svg"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Create Project",
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
                              "Create you projct and we take it \nfrom here",
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
                            hintText: "Project name",
                            controller: projectNameController,
                            onChanged: (val) {},
                            type: TextInputType.text,
                            color: Colors.black,
                          ),
                          DropDown(
                            hintText: "Project Manager",
                            item: managers,
                            onChanged: (value) {
                              projectManagerController.text = value;
                            },
                          ),
                          DropDown(
                            hintText: "Assignee",
                            item: assignees,
                            onChanged: (value) {
                              assigneeController.text = value;
                            },
                          ),
                          DateInput(
                            controller: deadlineController,
                            color: Colors.black,
                            onPress: () async {
                              DateTime? pickeddate = await showDatePicker(
                                selectableDayPredicate: (displayDate) {
                                  final dateNow = DateTime.now();
                                  return (displayDate.month == dateNow.month && displayDate.day >= dateNow.day)
                                  || displayDate.month > dateNow.month || displayDate.year > dateNow.year;
                                },
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
                            hintText: "Overview",
                            controller: overviewController,
                            onChanged: (val) {},
                            type: TextInputType.multiline,
                            color: Colors.black,
                          ),
                          RoundInput(
                            hintText: "To Do",
                            controller: toDoController,
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
                              createProject(context);
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
