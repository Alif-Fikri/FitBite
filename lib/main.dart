import 'package:fitbite/helper/menu.dart';
import 'package:fitbite/pages/detailmenu/food1.dart';
import 'package:fitbite/pages/home.dart';
import 'package:fitbite/pages/landingpage.dart';
import 'package:fitbite/pages/login.dart';
import 'package:fitbite/pages/profile.dart';
import 'package:fitbite/pages/signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fitbite/pages/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:fitbite/helper/cartprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBite',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuNav(),
    );
  }
}
