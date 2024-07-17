import 'package:flutter/material.dart';

class IdentificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동일인 판별'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('계정 소유자와 동일인인지 판별하는 과정입니다.'),
            SizedBox(height: 16),
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Center(child: Text('얼굴을 원 안에 넣어 주세요')),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 동일인 판별 로직 추가
                Navigator.pop(context, true); // 동일인 판별이 성공하면 true를 반환
              },
              child: Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}
