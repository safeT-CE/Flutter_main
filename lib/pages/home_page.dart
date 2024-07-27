import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/alarm');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
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
                color: Colors.lightGreen[100],
                child: Text('공지사항'),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.lightGreen[100],
                child: Row(
                  children: [
                    Image.asset('assets/image/seed.png', width: 50, height: 50),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '(총 이용시간)시간째 지구를 사랑하는 (닉네임)님 (레벨)이에요',
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/rent');
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.lightGreen[100],
                    ),
                    child: Text('대여하기'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/return');
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.lightGreen[100],
                    ),
                    child: Text('반납하기'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.lightGreen[100],
                child: Text('지도영역\n여기서 연결되는 페이지는 강 달랑 지도+킥보드 위치 핀 꽂기(실제로 동작 X)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
