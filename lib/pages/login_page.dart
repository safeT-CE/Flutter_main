import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
            //Image.asset('assets/image/logo.png', height: 150),
            SizedBox(height: 16),
            Text(
              'LOGIN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.lightGreen[100],
                hintText: '01012345678',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _autoLogin,
                  onChanged: (value) {
                    setState(() {
                      _autoLogin = value!;
                    });
                  },
                ),
                Text('자동 로그인'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                //primary: Colors.lightGreen[100],
              ),
              child: Text('로그인'),
            ),
            SizedBox(height: 32),
            Text(
              'or continue with',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
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
