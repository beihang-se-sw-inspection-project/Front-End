import 'package:flutter/material.dart';
import 'package:report_app/Screen/GetStart.dart';
import 'package:report_app/Screen/LoginScreen.dart';
import 'package:report_app/Screen/MainScreen.dart';
import 'package:report_app/Screen/RegisterScreen.dart';
import 'package:report_app/Screen/SplashScreen.dart';

import 'Service/share_pref_service.dart';
import 'di/configure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/main": (context) => MainScreen(),
      },
      home: SplashScreen(),
    );
  }
}


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SharePrefService sharePrefService = getIt.get();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          child: sharePrefService.getAccessToken().isNotEmpty ? MainScreen() : GetStart(),
        ),
    );
  }
}
