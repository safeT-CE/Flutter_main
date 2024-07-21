import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:safet/pages/agreement_page.dart';
import 'package:safet/pages/auth_done_page.dart';
import 'package:safet/pages/auth_phonenum_page.dart';

import 'pages/agreement_page.dart';
import 'pages/alarm_page.dart';
import 'pages/announcement_page.dart';
import 'pages/auth_done_page.dart';
import 'pages/auth_face_cam_page.dart';
import 'pages/auth_face_how_page.dart';
import 'pages/auth_idcard_cam_page.dart';
import 'pages/auth_idcard_how_page.dart';
import 'pages/auth_idinfo_check_page.dart';
import 'pages/auth_page.dart';
import 'pages/auth_phonenum_page.dart';
import 'pages/auth_phonenum_verificate_page.dart';
import 'pages/home_page.dart';
import 'pages/lock_page.dart';
import 'pages/login_page.dart';
import 'pages/map_page.dart';
import 'pages/profile_page.dart';
import 'pages/rent_page.dart';
import 'pages/return_page.dart';
import 'pages/splash_page.dart';
import 'pages/payment_page.dart';
import 'pages/number_input_page.dart';
import 'pages/qr_scanner_page.dart';
import 'pages/identification_page.dart';

import '../utils/auth_helper.dart';

//색상 선언
const Color safeTblack=Color(0xFF1A1A1A);
const Color safeTgray=Color(0xFFA1A1A1);
const Color safeTgreen=Color(0xFFAFD08F);
const Color safeTlightgreen=Color(0xFFE7F1DE);

Future<void> main() async {
  AuthRepository.initialize(appKey: '0fb225459d4b8c516f20ff340eceb313');
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

  MyApp({required this.frontCamera, required this.backCamera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
      routes: {
        '/agreement': (context) => AgreementPage(),
        '/alarm': (context) => AlarmPage(),
        '/announcement': (context) => AnnouncementPage(),
        '/auth_done': (context) => AuthDonePage(),
        '/auth_face_cam': (context) => FaceCamPage(camera: frontCamera),
        '/auth_face_how': (context) => FaceHowPage(),
        '/auth_id_cam': (context) => IdCamPage(camera: backCamera),
        '/auth_id_how': (context) => IdHowPage(),
        '/auth_idinfo': (context) => IdInfoCheckPage(recognizedLines: []),
        '/auth': (context) => AuthPage(),
        '/auth_phonenumber': (context) => PhoneNumberInputPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/map': (context) => MapPage(),
        '/profile': (context) => ProfilePage(),
        '/rent': (context) => RentPage(),
        '/return': (context) => ReturnPage(),
        '/payment': (context) => PaymentPage(),
        '/qr': (context) => QrScannerPage(),
        '/number': (context) => NumberInputPage(),
        '/identification': (context) => IdentificationPage(),
      },
    );
  }
}