import 'package:flutter/material.dart';

import 'announcement_page.dart';
import 'ask_page.dart';
import 'payment_selection_page.dart';
import 'penalty_point_page.dart';
import 'ticket_purchase_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.lightGreen[100],
              child: Column(
                children: [
                  const Text('010-1234-5678 님'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset('assets/image/seed.png', width: 50, height: 50),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'LV 5 \n 이용시간: \n 누적 이동 거리: \n',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('공지사항'),
              onTap: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => AnnouncementPage()),
                );
              },
            ),
            /*Divider(),
            ListTile(
              title: Text('상세 이용 내역'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsageDetailsPage(
                    date: '2024-06-01',
                    duration: '10m 21s',
                    distance: '800m',
                    startLocation: LatLng(37.5665, 126.9780), // 예시 좌표
                    endLocation: LatLng(37.5665, 126.9780), // 예시 좌표
                  )),
                );
              },
            ),*/
            const Divider(),
            ListTile(
              title: const Text('벌점 기록'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PenaltyPointPage()),
                );
              },
            ),
           const Divider(), 
           ListTile(
              title: const Text('카드 등록'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentSelectionPage()),
                );
              },
            ),
            const Divider(), 
            ListTile(
              title: const Text('문의하기'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AskPage()),
                );
              },
            ),
            const Divider(), 
            ListTile(
              title: const Text('이용권 구매'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicketPurchasePage()),
                );
              },
            ),
            const Divider(), 
            ListTile(
              title: const Text('로그아웃'),
              onTap: () {
                // 로그아웃 기능 구현
              },
            ),
          ],
        ),
      ),
    );
  }
}
