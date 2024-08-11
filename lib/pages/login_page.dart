import 'package:flutter/material.dart';
import 'package:safet/main.dart';

import '../utils/auth_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  bool _autoLogin = false;

  Future<void> _login() async {
    // 여기에 실제 로그인 로직을 구현
    await AuthHelper.setLoginStatus(true);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/image/safeT.png', height: 80),
            // SizedBox(height: 16),
            // Text(
            //   'LOGIN',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //     color: safeTgray,
            //   ),
            // ),
            SizedBox(height: 32),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: '01012345678',
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: safeTlightgreen, // 테두리 색상 설정
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: safeTlightgreen, // 활성 상태의 테두리 색상 설정
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: safeTlightgreen, // 포커스 상태의 테두리 색상 설정
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: safeTlightgreen, // 체크되지 않은 상태의 색상 설정
                  ),
                  child: Checkbox(
                    value: _autoLogin,
                    onChanged: (value) {
                      setState(() {
                        _autoLogin = value!;
                      });
                    },
                    activeColor: safeTlightgreen, // 체크된 상태의 색상 설정
                  ),
                ),
                Text('자동 로그인'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: safeTgreen,
                foregroundColor: Colors.white,
              ),
              child: Text('로그인'),
            ),
            SizedBox(height: 32),
            Text(
              'or continue with',
              textAlign: TextAlign.center,
              style: TextStyle(color: safeTgray),
            ),
            SizedBox(height: 16),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       icon: Image.asset('assets/image/google.png'),
            //       iconSize: 50,
            //       onPressed: () {
            //         // Google 로그인 로직
            //         _login();
            //       },
            //     ),
            //     SizedBox(width: 16),
            //     IconButton(
            //       icon: Image.asset('assets/image/naver.png'),
            //       iconSize: 50,
            //       onPressed: () {
            //         // Naver 로그인 로직
            //         _login();
            //       },
            //     ),
            //     SizedBox(width: 16),
            //     IconButton(
            //       icon: Image.asset('assets/image/kakao.png'),
            //       iconSize: 50,
            //       onPressed: () {
            //         // Kakao 로그인 로직
            //         _login();
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
