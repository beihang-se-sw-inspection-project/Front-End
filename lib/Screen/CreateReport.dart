import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/RoundInput.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';

class CreateReport extends StatefulWidget {
  _createReport createState() => _createReport();
}

class _createReport extends State<CreateReport> {
  final TextEditingController statusController = TextEditingController();
  final TextEditingController taskReportController = TextEditingController();

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
                    RoundInput(
                      hintText: "Report",
                      controller: taskReportController,
                      onChanged: (val) {},
                      type: TextInputType.multiline,
                      color: Colors.black,
                    ),
                    // DropDown(
                    //
                    //   hintText: "Status",
                    //   item: [
                    //     'Complete',
                    //     'Bug',
                    //   ],
                    // ),

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
