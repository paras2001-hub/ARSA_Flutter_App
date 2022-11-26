

import 'package:flutter/material.dart';

import 'Pages/import_pages.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  '/loading',
      routes : {
        '/loading' : (context) => Loading(),
        '/home' : (context) => Home(),
        '/about' : (context) => About(),
        '/graphs' : (context) => Graphs(),
        '/overview' : (context) => Overview(),
        '/mlModelDescription' : (context) => MlModelDescription(),
        '/licences' : (context) => Licences(),
        '/groupInformation' : (context) => GroupInformation(),
        '/respLoading' : (context) => RespLoading()

      }
    );
  }
}
