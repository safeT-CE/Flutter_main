import 'package:flutter/material.dart';

class NumberInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('번호 직접 입력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: '직접 번호를 입력하세요',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 번호 입력 확인
              },
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
