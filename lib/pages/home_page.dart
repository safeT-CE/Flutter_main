import 'package:flutter/material.dart';
import 'package:safet/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'safeT',
          style: TextStyle(
            color: safeTblack,
            fontFamily: "safeTtitle",
            fontSize: 24),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: SizedBox(), // Empty widget to ensure the title is centered
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: safeTgreen),
            onPressed: () {
              Navigator.pushNamed(context, '/alarm');
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: safeTgreen),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
        iconTheme: IconThemeData(color: safeTgreen),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/announcement');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: safeTlightgreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('2024년 이용권 업그레이드 안내'),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: safeTgreen,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: safeTlightgreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/image/level1.png', width: 50, height: 50),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '(총 이용시간)시간째\n지구를 사랑하는 (닉네임)님\n(레벨)이에요',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100, // 버튼 높이 조정
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/rent');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: safeTlightgreen, // 배경 색상 지정
                        foregroundColor: safeTblack, // 글자 색상 지정
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // 둥근 테두리 추가
                        ),
                      ),
                      child: Text('대여하기'),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 100, // 버튼 높이 조정
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/return');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: safeTlightgreen, // 배경 색상 지정
                        foregroundColor: safeTblack, // 글자 색상 지정
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // 둥근 테두리 추가
                        ),
                      ),
                      child: Text('반납하기'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/map');
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/seoul_map2.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12), // 둥근 테두리 추가
                      ),
                    ),
                    Center(
                      child: Text(
                        '지도',
                        style: TextStyle(
                          color: safeTblack,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
