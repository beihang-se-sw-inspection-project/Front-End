import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:report_app/Screen/AboutUs.dart';
import 'package:report_app/Screen/Dashboard.dart';
import 'package:report_app/Screen/GetStart.dart';
import 'package:report_app/Screen/HomeScreen.dart';
import 'package:report_app/Screen/LogoutScreen.dart';

import '../Components/Constant.dart';
import 'Report.dart';

class MainScreen extends StatefulWidget {
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _currentTab = 0;
  final tabs = [
    Scaffold(
      body: HomeScreen(),
    ),
    Scaffold(
      body: Dashboard(),
    ),
    Scaffold(
      body: Report(),
    ),
    Scaffold(
      body: AboutUs(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 14.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Report App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogoutScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: kPrimaryColor,
              size: 35,
            ),
          ),
        ],
      ),
      body: tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        selectedItemColor: inputBackgroundColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: "Report",
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "About Us",
            backgroundColor: kPrimaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
    );
  }
}
