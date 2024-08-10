import 'package:flutter/material.dart';
import 'package:safet/main.dart';

class LockedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: safeTgray),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center( // Center 위젯으로 Column을 감싸서 중앙 정렬
        child: Padding(
          //padding: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.only(top:100.0, left: 16.0, right: 16.0), // 전체적으로 위로 이동

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Image.asset(
                'assets/image/locked.png', 
                width: 200,
              ),
              SizedBox(height: 30),
              Text(
                '벌점 누적 n회로 대여가 불가능합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
