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
            icon: Icon(Icons.close,color: safeTgray),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/image/auth_idcard.png', 
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
    );
  }
}