import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:provider/provider.dart';
import 'package:safet/pages/agreement_page.dart';
import 'package:safet/pages/auth_done_page.dart';
import 'package:safet/pages/auth_face_cam_page.dart';
import 'package:safet/pages/auth_phonenum_page.dart';

import 'pages/alarm_page.dart';
import 'pages/announcement_page.dart';
import 'pages/ask_page.dart';
import 'pages/auth_done_page.dart';
import 'pages/auth_face_cam_page.dart';
import 'pages/auth_face_how_page.dart';
import 'pages/auth_idcard_cam_page.dart';
import 'pages/auth_idcard_how_page.dart';
import 'pages/auth_idinfo_check_page.dart';
import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/identification_page.dart';
import 'pages/inquiry_data.dart';
import 'pages/lock_page.dart';
import 'pages/login_page.dart';
import 'pages/map_page.dart';
import 'pages/number_input_page.dart';
import 'pages/one_on_one_inquiry_page.dart';
import 'pages/payment_selection_page.dart';
import 'pages/penalty_page.dart';
import 'pages/profile_page.dart';
import 'pages/rent_page.dart';
import 'pages/return_page.dart';
import 'pages/splash_page.dart';
import 'pages/theme_provider.dart';
import 'pages/violation_data.dart';
import '../utils/auth_helper.dart';

const Color safeTblack = Color(0xFF1A1A1A);
const Color safeTgray = Color(0xFFA1A1A1);
const Color safeTgreen = Color(0xFFAFD08F);
const Color safeTlightgreen = Color(0xFFE7F1DE);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 카메라 초기화
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
  final backCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);

  runApp(MyApp(frontCamera: frontCamera, backCamera: backCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription frontCamera;
  final CameraDescription backCamera;

  const MyApp({required this.frontCamera, required this.backCamera});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InquiryData()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ViolationData()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'SafeT',
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: SplashPage(),
            routes: {
              '/agreement': (context) => AgreementPage(),
              '/alarm': (context) => AlarmPage(),
              '/announcement': (context) => AnnouncementPage(),
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
              '/penalty': (context) => PenaltyPage(),
              '/one_on_one_inquiry': (context) => OneOnOneInquiryPage(
                initialCategory: '벌점',
                initialTitle: '벌점 기록에 대한 문의',
              ),
            },
          );
        },
      ),
    );
  }
}
