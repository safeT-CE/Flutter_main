import 'package:flutter/material.dart';
import 'pages/announcement_page.dart';
import 'pages/profile_page.dart';
import 'pages/rent_page.dart';
import 'pages/return_page.dart';
import 'pages/map_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
      routes: {
        '/announcement': (context) => AnnouncementPage(),
        '/profile': (context) => ProfilePage(),
        '/rent': (context) => RentPage(),
        '/return': (context) => ReturnPage(),
        '/map': (context) => MapPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/announcement');
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
                child: Text('공지사항어쩌구버쩌구살라살라'),
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
                    //Image.asset('assets/seed.png', width: 50, height: 50),
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
                      primary: Colors.lightGreen[100],
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
                      primary: Colors.lightGreen[100],
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
