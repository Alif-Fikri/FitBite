import 'package:fitbite/helper/detailmenu.dart';
import 'package:fitbite/pages/landingpage.dart';
import 'package:fitbite/pages/login.dart';
import 'package:fitbite/pages/signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fitbite/pages/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailPage(),
    );
  }
}
