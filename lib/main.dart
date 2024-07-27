import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safet/pages/agreement_page.dart';
import 'package:safet/pages/auth_number_page.dart';
import 'package:safet/pages/payment_selection_page.dart';
import 'package:safet/pages/theme_provider.dart';

import 'pages/alarm_page.dart';
import 'pages/announcement_page.dart';
import 'pages/ask_page.dart';
import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/identification_page.dart';
import 'pages/inquiry_data.dart';
import 'pages/login_page.dart';
import 'pages/map_page.dart';
import 'pages/number_input_page.dart';
import 'pages/profile_page.dart';
import 'pages/rent_page.dart';
import 'pages/return_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InquiryData()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'SafeT',
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: SplashPage(),
      routes: {
        '/agreement': (context) => AgreementPage(),
        '/alarm': (context) => AlarmPage(),
        '/announcement': (context) => AnnouncementPage(),
        '/auth_number': (context) => AuthNumberPage(),
        '/auth': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/map': (context) => MapPage(),
        '/profile': (context) => ProfilePage(),
        '/rent': (context) => RentPage(),
        '/return': (context) => ReturnPage(),
        '/payment': (context) => PaymentSelectionPage(),
        '/number': (context) => NumberInputPage(onNumberEntered: () {}),
        '/identification': (context) => IdentificationPage(),
        '/ask': (context) => AskPage(),
      },
    );
  }
}
