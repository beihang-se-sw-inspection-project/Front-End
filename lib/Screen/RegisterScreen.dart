import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:report_app/Components/Dropdown.dart';
import 'package:report_app/Components/PasswordInputField.dart';
import 'package:report_app/Components/RoundInput.dart';
import 'package:report_app/Model/register_req.dart';
import 'package:report_app/Screen/HomeScreen.dart';
import 'package:report_app/Screen/MainScreen.dart';
import 'package:report_app/Service/error_throwable.dart';
import 'package:report_app/Service/share_pref_service.dart';

import '../Components/Constant.dart';
import '../Components/PrimaryButton.dart';
import '../Service/api_call_handler.dart';
import '../Service/api_service.dart';
import '../di/configure.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  bool isShow = true;
  final ApiService _apiService = getIt.get();
  final SharePrefService sharePrefService = getIt.get();

  void register(context) async {
    debugPrint("rolecontroller: ${roleController.text}");
    final registerReq = RegisterReq(
      RegisterDataReq(
        'users',
        RegisterDataAttrReq(
          usernameController.text,
          emailController.text,
          passwordController.text,
          roleController.text,
          passwordController.text,
        ),
      ),
    );
    final caller = _apiService.register(registerReq);
    final callHelper = ApiCallHandler(caller);
    try {
      final response = await callHelper.execute();
      await sharePrefService
          .setAccessToken(response.data.attributes.accessToken);
      Navigator.of(context).pushNamed('/main');
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
          "Profile",
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
                child: SvgPicture.asset("asset/image/register_logo.svg"),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Sign Up",
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
                        "Enter your username email role and \n password",
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
                      hintText: "Email",
                      controller: emailController,
                      onChanged: (val) {},
                      type: TextInputType.text,
                      color: Colors.black,
                    ),
                    RoundInput(
                      hintText: "Username",
                      controller: usernameController,
                      onChanged: (val) {},
                      type: TextInputType.text,
                      color: Colors.black,
                    ),
                    PasswordInputField(
                      hideText: "Password",
                      onChanged: (val) {},
                      onPress: () {},
                      controller: passwordController,
                    ),
                    DropDown(
                      hintText: "Select the role",
                      item: [
                        'Manger',
                        'Developer',
                        'inspector',
                      ],
                      onChanged: (value) {
                        roleController.text = value;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      text: 'Get Start',
                      press: () => register(context),
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
