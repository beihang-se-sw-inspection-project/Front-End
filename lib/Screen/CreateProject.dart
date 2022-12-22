import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/DateInput.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/RoundInput.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';

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
                child: SvgPicture.asset("asset/image/create_project_icon.svg"),
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
                    // DropDown(
                    //   hintText: "Project Manager",
                    //   item: [
                    //     'Shino',
                    //     'Mavin',
                    //     'Sam',
                    //   ],
                    // ),
                    // DropDown(
                    //   hintText: "Assignee",
                    //   item: [
                    //     'Shino',
                    //     'Mavin',
                    //     'Sam',
                    //   ],
                    // ),
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
                                  DateFormat('yyyy/MM/dd').format(pickeddate);
                            },
                          );
                        }
                      },
                    ),
                    // DropDown(
                    //   hintText: "Priority",
                    //   item: [
                    //     'High',
                    //     'Low',
                    //     'Medium',
                    //   ],
                    // ),
                    RoundInput(
                      hintText: "Overview",
                      controller: overviewController,
                      onChanged: (val) {},
                      type: TextInputType.multiline,
                      color: Colors.black,
                    ),
                    RoundInput(
                      hintText: "To Do",
                      controller: overviewController,
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
                        Navigator.of(context).pushNamed('/main');
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
