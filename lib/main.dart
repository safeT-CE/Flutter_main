import 'package:flutter/material.dart';

import 'pages/alarm_page.dart';
import 'pages/announcement_page.dart';
import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/map_page.dart';
import 'pages/profile_page.dart';
import 'pages/rent_page.dart';
import 'pages/return_page.dart';
import 'pages/splash_page.dart';

import '../utils/auth_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
      routes: {
        '/alarm':(context) => AlarmPage(),
        '/announcement': (context) => AnnouncementPage(),
        '/auth': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        '/map': (context) => MapPage(),
        '/profile': (context) => ProfilePage(),
        '/rent': (context) => RentPage(),
        '/return': (context) => ReturnPage(),
      },
    );
  }
}
