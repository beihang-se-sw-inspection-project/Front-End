import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Container(
          child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SvgPicture.asset("asset/image/app_logo.svg"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "The purpose of software inspection is to look for defects (of understanding, interpretation, translation, etc.), deviations, especially regarding quality clauses, absences or abundances etc., and to provide the elements to make corrections. Software inspection is not designed to make corrections. In order to be effective, software inspection must be prepared and carried out by a separate team from the realization team.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
