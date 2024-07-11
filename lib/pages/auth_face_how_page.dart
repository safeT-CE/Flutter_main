import 'package:flutter/material.dart';
import 'package:safet/main.dart';
import 'package:safet/main.dart';

class FaceHowPage extends StatelessWidget {
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
            Text(
              '신분증 사진과 비교하여 본인 여부를 확인합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Image.asset(
              'assets/image/auth_selfie.png', 
              width: 200,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFFFFE4E1), // 배경색 핑크색
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.yellow),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '마스크, 선글라스 등 신분증 사진 촬영 당시\n착용하지 않았던 악세서리를 착용할 경우,\n식별이 어려울 수 있습니다.\n반드시 벗은 후 진행해 주세요.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Next button action
                Navigator.pushNamed(context, '/auth_face_cam');
              },
              child: Text(
                '다음',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}