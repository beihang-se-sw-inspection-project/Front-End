import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:report_app/Components/PrimaryButton.dart';
import 'package:report_app/Screen/CreateTask.dart';

import '../Components/Constant.dart';
import '../Model/project_list_req.dart';
import '../Service/share_pref_service.dart';
import '../di/configure.dart';

class ProjectDetail extends StatelessWidget {
  final ProjectDataAttrReq projectData;
  final ProjectDataReq project;
  final SharePrefService sharePrefService = getIt.get();

  ProjectDetail({super.key, required this.projectData, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Project Detail",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: inputBackgroundColor,
      ),
      body: SingleChildScrollView(
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
                projectData.project_name,
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
                    projectData.date,
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
                    "asset/image/account_icon.svg",
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Project Manager: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    projectData.project_manager,
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
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "asset/image/account_icon.svg",
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Assignee: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    projectData.assignee,
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
                    projectData.priority,
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
                "Overview",
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
                projectData.overview,
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
                "To Do",
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
                projectData.to_do,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Center(
              child: sharePrefService.getRole() == "inspector"
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: PrimaryButton(
                        width: MediaQuery.of(context).size.width * .9,
                        text: "CreateTask",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateTask(
                                projectId: project.id,
                                project_manager: projectData.project_manager,
                                inspector: projectData.assignee,
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
      ),
    );
  }
}
