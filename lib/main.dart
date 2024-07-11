import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
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
import 'pages/login_page.dart';
import 'pages/map_page.dart';
import 'pages/profile_page.dart';
import 'pages/rent_page.dart';
import 'pages/return_page.dart';
import 'pages/splash_page.dart';

import '../utils/auth_helper.dart';

//색상 선언
const Color safeTgray=Color(0xFFA1A1A1);

Future<void> main() async {
  AuthRepository.initialize(appKey: 'aa9fefc3e4785e9135414b7455921e03');
  WidgetsFlutterBinding.ensureInitialized();
  
  // 카메라 초기화
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
      routes: {
        '/agreement':(context) => AgreementPage(),
        '/alarm':(context) => AlarmPage(),
        '/announcement': (context) => AnnouncementPage(),
        '/auth_done':(context) => AuthDonePage(),
        '/auth_face_how':(context) => FaceHowPage(),
        '/auth_face_cam':(context) => FaceCamPage(camera: camera),
        '/auth_id_cam':(context) => IdCamPage(camera: camera),
        '/auth_id_how':(context) => IdHowPage(),
        '/auth_idinfo':(context) => IdInfoCheckPage(),
        '/auth': (context) => AuthPage(),
        '/auth_phonenumber':(context) => PhoneNumberInputPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/map': (context) => MapPage(),
        '/profile': (context) => ProfilePage(),
        '/rent': (context) => RentPage(),
        '/return': (context) => ReturnPage(),
      },
    );
  }
}
