import 'package:arsa_02/pages/groupInfo.dart';
import 'package:arsa_02/pages/home.dart';
import 'package:arsa_02/pages/splashscreen.dart';
import 'package:arsa_02/pages/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes : {
          '/home': (context) => Home(),
          '/result': (context) => Result(),
          '/groupInformation': (context) => GroupInfo()
    }
    );
  }
}


