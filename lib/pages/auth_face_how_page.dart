import 'package:flutter/material.dart';
import 'package:safet/main.dart';
import 'package:safet/models/user_info.dart';

class FaceHowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserInfo userInfo = ModalRoute.of(context)!.settings.arguments as UserInfo;

    // 디버깅 메시지 출력
    print('FaceHowPage - UserInfo received: ${userInfo.toString()}');

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '신분증 사진과 비교하여 \n본인 여부를 확인합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Image.asset(
              'assets/image/auth_selfie.png', 
              width: 200,
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF0B0B0),
                borderRadius: BorderRadius.circular(8),
              ),
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
                backgroundColor: safeTgreen,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                // Next button action
                Navigator.pushNamed(
                  context, 
                  '/auth_face_cam',
                  arguments: userInfo, // 전달할 UserInfo 객체 추가
                );
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
