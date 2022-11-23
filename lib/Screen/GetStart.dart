import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:report_app/Screen/LoginScreen.dart';
import 'package:report_app/Screen/RegisterScreen.dart';
import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';

class GetStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: inputBackgroundColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset("asset/image/user profile.svg"),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Let get started",
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
                      "The app allow user to track the task \n and inspect the task.",
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
                  PrimaryButton(
                    text: 'Create new account',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    color: kPrimaryColor,
                    textColor: inputBackgroundColor,
                    borderColor: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  PrimaryButton(
                    text: 'Sign in',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    color: inputBackgroundColor,
                    textColor: kPrimaryColor,
                    borderColor: kPrimaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
