import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // 애니메이션 속도를 늦추기 위해 2초로 설정
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // MediaQuery에 접근할 수 있는 시점이므로 여기서 Animation을 초기화
    _animation = Tween<double>(
      begin: -200, // 시작 위치 (화면 왼쪽 바깥)
      end: MediaQuery.of(context).size.width / 2 - 40, // 끝 위치 (화면 중앙에서 오른쪽으로 10픽셀 이동)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // 애니메이션 시작
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 애니메이션 완료 후 2초 대기
        Timer(Duration(seconds: 2), () {
          _checkLoginStatus();
        });
      }
    });
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      //Navigator.pushReplacementNamed(context, '/home');
      Navigator.pushReplacementNamed(context, '/auth');
    } else {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Text(
              'safe',
              style: TextStyle(
                fontSize: 40,
                fontFamily: "safeTtitle",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: _animation.value,
                top: MediaQuery.of(context).size.height / 2 - 50, // 화면 중앙
                child: child!,
              );
            },
            child: Image.asset(
              'assets/image/kickboard.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}









/*아웃트로
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showT = false; // T를 보여줄지 여부를 제어하는 변수

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // 애니메이션 속도를 늦추기 위해 2초로 설정
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _animation = Tween<double>(
      begin: 0, // 시작 위치 (화면 왼쪽 바깥)
      end: MediaQuery.of(context).size.width + 200, // 끝 위치 (화면 오른쪽 바깥으로 이동)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // 애니메이션 시작
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 애니메이션 완료 후 다음 화면으로 이동
        Timer(Duration(seconds: 3), () {
          _checkLoginStatus();
        });
      }
    });

    // 애니메이션이 절반에 도달했을 때 T를 나타내도록 설정
    _controller.addListener(() {
      if (_controller.value > 0.8 && !showT) { // 애니메이션의 절반 시점에 T를 나타내기 시작
        setState(() {
          showT = true;
        });
      }
    });
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'safe',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "safeTtitle",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // T를 페이드 인으로 표시
                AnimatedOpacity(
                  opacity: showT ? 1.0 : 0.0, // showT가 true일 때 투명도를 1로 설정
                  duration: Duration(milliseconds: 1000), // 페이드 인 속도 (0.5초)
                  child: Text(
                    'T',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "safeTtitle",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: _animation.value,
                top: MediaQuery.of(context).size.height / 2 - 50, // 화면 중앙
                child: child!,
              );
            },
            child: Image.asset(
              'assets/image/kickboard.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
*/